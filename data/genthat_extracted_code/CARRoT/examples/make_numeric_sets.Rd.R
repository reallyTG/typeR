library(CARRoT)


### Name: make_numeric_sets
### Title: Transforming the set of predictors into a numeric set
### Aliases: make_numeric_sets

### ** Examples

#creating a categorical numeric variable

a<-t(rmultinom(100,1,c(0.2,0.3,0.5)))%*%c(1,2,3)

#creating an analogous non-numeric variable

c<-array(NA,100)
c[a==1]='red'
c[a==2]='green'
c[a==3]='blue'

#creating a data-set

b<-data.frame(matrix(c(a,rbinom(100,1,0.3),runif(100,0,1)),ncol=3))

#making the first column of the data-set non-numeric

b[,1]=data.frame(c)

#running the function

make_numeric_sets(combn(3,2),1:3,1,b,sample(1:100,60),100)



