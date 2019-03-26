library(NPCirc)


### Name: bw.rt
### Title: Rule of thumb
### Aliases: bw.rt
### Keywords: circular density

### ** Examples

set.seed(2012)
n <- 100
x <- rcircmix(n,model=7)
bw.rt(x) 
bw.rt(x, robust=TRUE)



