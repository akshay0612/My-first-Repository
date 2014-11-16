A=imread('fruit1.bmp');

disp('Encryption');
s=input('Enter the String: ','s');
ch=uint8(s);
num=dec2bin(ch,8);
len=length(s);

for i=1:128
    for j=1:128
        B(i,j)=A(i,j);
    end
end

B(128,128)=len;

i=1; j=1;
for k=1:len  
        p=A(i,j);
        n=dec2bin(p,8);
        n(1,7)=num(k,1);
        n(1,8)=num(k,2);
        z=bin2dec(n);
        B(i,j)=z;
        
        p=A(i,j+1);
        n=dec2bin(p,8);
        n(1,7)=num(k,3);
        n(1,8)=num(k,4);
        z=bin2dec(n);
        B(i,j+1)=z;
        
        p=A(i,j+2);
        n=dec2bin(p,8);
        n(1,7)=num(k,5);
        n(1,8)=num(k,6);
        z=bin2dec(n);
        B(i,j+2)=z;
        
        p=A(i,j+3);
        n=dec2bin(p,8);
        n(1,7)=num(k,7);
        n(1,8)=num(k,8);
        z=bin2dec(n);
        B(i,j+3)=z;
        
        j=j+4;
        
     if j>=128
        j=1;
        i=i+1;
    end
    
    if i>=128
        break;
    end
end        

subplot(2,2,1);
imshow(A);
title('Original Image');
subplot(2,2,2);
imshow(B);
title('Hidden Image'); 

disp('Decryption');
li=B(128,128);

i=1;j=1;
for k=1:li
   
    pi=B(i,j);
    ni=dec2bin(pi,8);
    numi(k,1)=ni(1,7);
    numi(k,2)=ni(1,8);
    
    pi=B(i,j+1);
    ni=dec2bin(pi,8);
    numi(k,3)=ni(1,7);
    numi(k,4)=ni(1,8);
    
    pi=B(i,j+2);
    ni=dec2bin(pi,8);
    numi(k,5)=ni(1,7);
    numi(k,6)=ni(1,8);
    
    pi=B(i,j+3);
    ni=dec2bin(pi,8);
    numi(k,7)=ni(1,7);
    numi(k,8)=ni(1,8);
    
    j=j+4;
    
    chi=bin2dec(numi);
    deci=char(chi);
    
     if j>=128
        j=1;
        i=i+1;
    end
    
    if i>=128
        break;
    end
    
end

disp('Decrypted Text:');
disp(deci);
