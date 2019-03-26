library(hettx)


### Name: SE
### Title: Extract the standard errors from a var-cov matrix.
### Aliases: SE

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
es <- estimate_systematic( Yobs ~ Z,  interaction.formula = ~ A + B, data = df )
SE(es)




