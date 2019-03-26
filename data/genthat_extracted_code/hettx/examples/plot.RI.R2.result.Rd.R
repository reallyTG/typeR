library(hettx)


### Name: plot.RI.R2.result
### Title: Make a plot of the treatment effect R2 estimates
### Aliases: plot.RI.R2.result

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
es <- estimate_systematic( Yobs ~ Z,  interaction.formula = ~ A + B, data = df )
r2_out <- R2(es)
plot(r2_out)




