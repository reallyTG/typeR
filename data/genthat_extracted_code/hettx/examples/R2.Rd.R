library(hettx)


### Name: R2
### Title: Estimate treatment variation R2
### Aliases: R2

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
es <- estimate_systematic( Yobs ~ Z,  interaction.formula = ~ A + B, data = df )
r2_out <- R2(es)




