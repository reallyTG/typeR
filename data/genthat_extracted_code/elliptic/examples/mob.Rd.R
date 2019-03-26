library(elliptic)


### Name: mob
### Title: Moebius transformations
### Aliases: mob %mob%
### Keywords: math

### ** Examples

M <- matrix(c(11,6,9,5),2,2)
x <- seq(from=1+1i,to=10-2i,len=6)

M %mob% x
plot(mob(M,x))



