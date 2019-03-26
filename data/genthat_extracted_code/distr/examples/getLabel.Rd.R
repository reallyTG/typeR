library(distr)


### Name: getLabel
### Title: Labels for distribution objects
### Aliases: getLabel
### Keywords: distribution

### ** Examples

## example due to Kouros Owzar:
foo<- function(law,n, withnames = TRUE)
  {
    data.frame(muhat=mean(r(law)(n)),n=n,law= getLabel(law,withnames))
  } 
### a function that groups certain informations on 
##  created with distribution objects
do.call("rbind",lapply(list(Exp(1),Norm(0,1),Weibull(1,1)),foo,n=100))
do.call("rbind",lapply(list(Exp(1),Norm(0,1),Weibull(1,1)),foo,n=100,FALSE))



