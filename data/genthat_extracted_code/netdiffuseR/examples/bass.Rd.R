library(netdiffuseR)


### Name: bass
### Title: Bass Model
### Aliases: bass fitbass fitbass.diffnet fitbass.default plot.diffnet_bass
###   bass_F bass_dF bass_f

### ** Examples

# Fitting the model for the Brazilian Farmers Data --------------------------
data(brfarmersDiffNet)
ans <- fitbass(brfarmersDiffNet)

# All the methods that work for the -nls- object work here
ans
summary(ans)
coef(ans)
vcov(ans)

# And the plot method returns both, fitted and observed curve
plot(ans)




