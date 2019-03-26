library(hettx)


### Name: estimate_systematic
### Title: Calculate systematic effects model using LATE, ITT, or full
###   potential outcomes.
### Aliases: estimate_systematic

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
es <- estimate_systematic( Yobs ~ Z,  interaction.formula = ~ A + B, data = df )




