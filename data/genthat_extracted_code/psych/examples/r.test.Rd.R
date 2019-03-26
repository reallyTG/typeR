library(psych)


### Name: r.test
### Title: Tests of significance for correlations
### Aliases: r.test
### Keywords: multivariate models

### ** Examples


n <- 30 
r <- seq(0,.9,.1) 
rc <- matrix(r.con(r,n),ncol=2) 
test <- r.test(n,r)
r.rc <- data.frame(r=r,z=fisherz(r),lower=rc[,1],upper=rc[,2],t=test$t,p=test$p) 
round(r.rc,2) 

r.test(50,r)
r.test(30,.4,.6)       #test the difference between two independent correlations
r.test(103,.4,.5,.1)   #Steiger case A of dependent correlations 
r.test(n=103, r12=.4, r13=.5,r23=.1)  
#for complicated tests, it is probably better to specify correlations by name
r.test(n=103,r12=.5,r34=.6,r13=.7,r23=.5,r14=.5,r24=.8)   #steiger Case B 


##By default, the precision of p values is 2 decimals
#Consider three different precisions shown by varying the requested number of digits
r12 =  0.693458895410494 
r23 =  0.988475791500198 
r13 =  0.695966022434845 
print(r.test(n =  5105 ,  r12 =  r12 ,  r23 = r23 , r13 =  r13 )) #probability < 0.1
print(r.test(n =  5105 ,  r12 =  r12, r23 = r23 , r13 =  r13 ),digits=4) #p < 0.1001
print(r.test(n =  5105 , r12 =  r12, r23 = r23 , r13 =  r13 ),digits=8) #p< <0.1000759 



#an example of how to compare the elements of two matrices 
R1 <- lowerCor(bfi[1:200,1:5])  #find one set of Correlations
R2 <- lowerCor(bfi[201:400,1:5]) #and now another set sampled from the same population
test <- r.test(n=200, r12 = R1, r34 = R2)
round(lowerUpper(R1,R2,diff=TRUE),digits=2)  #show the differences between correlations
#lowerMat(test$p)  #show the p values of the difference between the two matrices
adjusted <- p.adjust(test$p[upper.tri(test$p)])
both <- test$p 
both[upper.tri(both)] <- adjusted
round(both,digits=2)  #The lower off diagonal are the raw ps, the upper the adjusted ps





