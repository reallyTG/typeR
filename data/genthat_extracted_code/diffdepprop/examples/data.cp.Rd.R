library(diffdepprop)


### Name: data.cp
### Title: Creates binary data of a given data set
### Aliases: data.cp

### ** Examples

# create a data set
v1=c(seq(1,10,0.5))
v2=c(seq(2,11,0.5))
n=c(seq(1,19,1))
new=cbind(n,v1,v2)
# cutpoint of the first test is 1.6, of the second test 2.3
result=data.cp(new,2,3,1.6,2.3)



