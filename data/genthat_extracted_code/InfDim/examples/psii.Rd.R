library(InfDim)


### Name: psii
### Title: A generic function to produce a matrix of Legendre polynomials
###   for IDM calculation
### Aliases: psii

### ** Examples


# The function is defined as
function(adjusted_age){
n=length(adjusted_age)

adjust_temp=rep(adjusted_age,each=n)
j_temp=rep(0:(n-1),n)

psii_elements=rep(NA,n*n)
for(i in 1:(n*n)){
psii_elements[i]=p.function(j=j_temp[i],x=adjust_temp[i])
  }
psii_temp=matrix(psii_elements,byrow=T,nrow=n,ncol=n)
return(psii_temp)
  }



