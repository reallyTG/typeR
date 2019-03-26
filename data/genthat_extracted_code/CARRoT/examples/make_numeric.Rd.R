library(CARRoT)


### Name: make_numeric
### Title: Turning a non-numeric variable into a numeric one
### Aliases: make_numeric

### ** Examples

#creating a non-numeric set

a<-t(rmultinom(100,1,c(0.2,0.3,0.5)))%*%c(1,2,3)

a[a==1]='red'
a[a==2]='green'
a[a==3]='blue'

#running the function

make_numeric(a,FALSE,sample(1:100,50))

make_numeric(a,TRUE,sample(1:100,50))



