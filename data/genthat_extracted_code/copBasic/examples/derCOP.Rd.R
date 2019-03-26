library(copBasic)


### Name: derCOP
### Title: Numerical Derivative of a Copula for V with respect to U
### Aliases: derCOP
### Keywords: copula (utility) copula (derivative) conditional cumulative
###   distribution function copula operator derivative copula (conditional
###   distribution)

### ** Examples

derCOP(cop=W,0.4,0.6); derCOP(cop=P,0.4,0.6); derCOP(cop=M,0.4,0.6)

lft <- derCOP(cop=PSP,   0.4, 0.6, derdir="left"  )
rgt <- derCOP(cop=PSP,   0.4, 0.6, derdir="right" )
cnt <- derCOP(cop=PSP,   0.4, 0.6, derdir="center")
cat(c(lft,rgt,cnt,"\n"))
#stopifnot(all.equal(lft,rgt), all.equal(lft,cnt))

# Let us contrive a singularity through this NOT A COPULA in the function "afunc".
"afunc" <- function(u,v, ...) return(ifelse(u <= 0.5, sqrt(u^2+v^2), P(u,v,...)))
lft <- derCOP(cop=afunc, 0.5, 0.67, derdir="left"  )
rgt <- derCOP(cop=afunc, 0.5, 0.67, derdir="right" )
cnt <- derCOP(cop=afunc, 0.5, 0.67, derdir="center")
cat(c(lft,rgt,cnt,"\n")) # The "right" version is correct.



