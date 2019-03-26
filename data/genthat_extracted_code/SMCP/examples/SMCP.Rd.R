library(SMCP)


### Name: SMCP
### Title: Smoothed minimax concave penalization (SMCP) method for
###   genome-wide association studies.
### Aliases: SMCP sp
### Keywords: model fitting

### ** Examples

x=matrix(rnorm(100*20),100,20)
y=rnorm(100)
fit=SMCP(x,y,0.3,0.3,3)
#solution path for this data
s.p=sp(x,y,0.3,10,0.05,3)



