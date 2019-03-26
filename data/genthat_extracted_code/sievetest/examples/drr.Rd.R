library(sievetest)


### Name: drr
### Title: Rosin - Rammler Distribution Functions
### Aliases: drr orr urr
### Keywords: distribution

### ** Examples

## The function drr is currently defined as
#  function (x, ex, xs) 
#  {
#      (ex/xs) * (x/xs)^(ex - 1) * exp(-(x/xs)^ex)
#  }

## The function urr is currently defined as
#  function (x, ex, xs) 
#  {
#      1 - exp(-(x/xs)^ex)
#  }

## The function orr is currently defined as
#  function (x, ex, xs) 
#  {
#      exp(-(x/xs)^ex)
#  }


x <- c(1,5,10,50,100)
ex <- 1.386
xs <- 178
stats::dweibull(x,shape=ex,scale=xs)
drr(x,ex,xs)
stats::pweibull(x,shape=ex,scale=xs)
urr(x,ex,xs)
stats::pweibull(x,shape=ex,scale=xs,lower.tail=FALSE)
orr(x,ex,xs)



