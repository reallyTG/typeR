library(psychotools)


### Name: piplot
### Title: Person-Item Plots for IRT Models
### Aliases: piplot
### Keywords: aplot

### ** Examples

## load verbal agression data
data("VerbalAggression", package = "psychotools")

## fit partial credit model to verbal aggression data
pcmod <- pcmodel(VerbalAggression$resp)

## create a person-item plot visualization of the fitted PCM
plot(pcmod, type = "piplot")

## just visualize the first six items and the person parameter plot
plot(pcmod, type = "piplot", items = 1:6, pcol = "lightblue")

if(requireNamespace("mirt")) {
## fit generalized partial credit model to verbal aggression data
gpcmod <- gpcmodel(VerbalAggression$resp)

## create a person-item plot visualization of the fitted GPCM
plot(gpcmod, type = "piplot")

## turn off the histogram and grid
plot(gpcmod, type = "piplot", histogram = FALSE, grid = FALSE)

## fit GPCM to verbal aggression data accounting for gender impact
mgpcmod <- gpcmodel(VerbalAggression$resp, impact = VerbalAggression$gender)

## create a person-item plot visualization of the fitted GPCM
plot(mgpcmod, type = "piplot", pcol = c("darkgreen", "darkorange"))
}



