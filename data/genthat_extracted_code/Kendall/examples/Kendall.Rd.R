library(Kendall)


### Name: Kendall
### Title: Kendall rank correlation
### Aliases: Kendall
### Keywords: nonparametric

### ** Examples


#First Example
#From Kendall (1976, p.42-43, Example 3.4)
A<-c(2.5,2.5,2.5,2.5,5,6.5,6.5,10,10,10,10,10,14,14,14,16,17)
B<-c(1,1,1,1,2,1,1,2,1,1,1,1,1,1,2,2,2)
summary(Kendall(A,B))
#Kendall obtains S=34, D=sqrt(116*60), tau=0.41

#Second Example
#From Kendall (1976, p.55, Example 4.3)
x<-c(1.5,1.5,3,4,6,6,6,8,9.5,9.5,11,12)
y<-c(2.5,2.5,7,4.5,1,4.5,6,11.5,11.5,8.5,8.5,10)
summary(Kendall(x,y))
#Kendall obtains S=34 and Var(S)=203.30




