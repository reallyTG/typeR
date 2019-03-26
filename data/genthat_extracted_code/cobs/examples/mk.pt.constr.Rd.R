library(cobs)


### Name: mk.pt.constr
### Title: COBS auxiliary for constructing pointwise constraint
###   specifications
### Aliases: mk.pt.constr
### Keywords: misc

### ** Examples

 ## from  ?cobs:
 x <- seq(-1,3,,150)
 con <- rbind(c( 1,min(x),0), # f(min(x)) >= 0
              c(-1,max(x),1), # f(max(x)) <= 1
              c(0,  0,   0.5))# f(0)      = 0.5
 r <- mk.pt.constr(con)
 str(r)



