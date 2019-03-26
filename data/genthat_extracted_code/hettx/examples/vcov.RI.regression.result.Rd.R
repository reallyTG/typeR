library(hettx)


### Name: vcov.RI.regression.result
### Title: Get vcov() from object.
### Aliases: vcov.RI.regression.result

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
es <- estimate_systematic( Yobs ~ Z,  interaction.formula = ~ A + B, data = df )
vcov(es)




