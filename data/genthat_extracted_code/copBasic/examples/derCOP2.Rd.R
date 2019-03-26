library(copBasic)


### Name: derCOP2
### Title: Numerical Derivative of a Copula for U with respect to V
### Aliases: derCOP2
### Keywords: copula (utility) copula (derivative) conditional cumulative
###   distribution function copula operator derivative copula (conditional
###   distribution)

### ** Examples

derCOP2(cop=W,0.4,0.6); derCOP2(cop=P,0.4,0.6); derCOP2(cop=M,0.4,0.6)

lft <- derCOP2(cop=P,     0.4,  0.6, derdir="left"  )
rgt <- derCOP2(cop=P,     0.4,  0.6, derdir="right" )
cnt <- derCOP2(cop=P,     0.4,  0.6, derdir="center")
cat(c(lft,rgt,cnt,"\n"))
# stopifnot(all.equal(lft,rgt), all.equal(lft,cnt))

# Let us contrive a singularity though this NOT A COPULA in the function "afunc".
"afunc" <- function(u,v, ...) return(ifelse(u <= 0.5, sqrt(u^2+v^2), P(u,v,...)))
lft <- derCOP2(cop=afunc, 0.67, 0.5, derdir="left"  )
rgt <- derCOP2(cop=afunc, 0.67, 0.5, derdir="right" )
cnt <- derCOP2(cop=afunc, 0.67, 0.5, derdir="center")
cat(c(lft,rgt,cnt,"\n")) # For this example, all are correct (see derCOP examples)



