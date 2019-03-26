library(hettx)


### Name: coef.RI.regression.result
### Title: Extract coefficients of a fit RI regression model.
### Aliases: coef.RI.regression.result

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
es <- estimate_systematic( Yobs ~ Z,  interaction.formula = ~ A + B, data = df )
coef(es)




