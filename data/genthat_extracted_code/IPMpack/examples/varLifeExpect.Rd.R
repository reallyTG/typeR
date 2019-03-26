library(IPMpack)


### Name: varLifeExpect
### Title: Calculates variation in life expectancy in a discretely
###   stochastic environment.
### Aliases: varLifeExpect

### ** Examples

# With a single continuous (e.g. size) stage
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff))
vle <- varLifeExpect(Pmatrix)

plot(Pmatrix@meshpoints, vle, ylab = "Variation life expectancy", 
xlab = "Continuous (e.g. size) stage", type = "l", ylim = c(0,max(vle)))





