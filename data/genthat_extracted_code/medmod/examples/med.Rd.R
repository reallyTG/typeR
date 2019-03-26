library(medmod)


### Name: med
### Title: Mediation
### Aliases: med

### ** Examples

set.seed(1234)
X <- rnorm(10)
M <- 0.5*X + rnorm(10)
Y <- 0.7*M + rnorm(10)
dat <- data.frame(X=X, M=M, Y=Y)

med(dat, dep = "Y", pred = "X", med = "M")

#
#  Mediation Estimates                                   
#  ----------------------------------------------------- 
#    Effect      Estimate    SE        Z        p        
#  ----------------------------------------------------- 
#    Indirect      0.3736    0.0920    4.059    < .001   
#    Direct        0.0364    0.1044    0.348     0.728   
#    Total         0.4100    0.1247    3.287     0.001   
#  ----------------------------------------------------- 
# 
#




