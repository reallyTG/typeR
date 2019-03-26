library(AICcmodavg)


### Name: countDist
### Title: Compute Summary Statistics from Distance Sampling Data
### Aliases: countDist countDist.default countDist.unmarkedFrameDS
###   countDist.unmarkedFitDS countDist.unmarkedFrameGDS
###   countDist.unmarkedFitGDS print.countDist
### Keywords: models

### ** Examples

##modified example from ?distsamp
## Not run: 
##D if(require(unmarked)){
##D data(linetran)
##D ##format data
##D ltUMF <- with(linetran, {
##D               unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4),
##D               siteCovs = data.frame(Length, area, habitat),
##D               dist.breaks = c(0, 5, 10, 15, 20),
##D               tlength = linetran$Length * 1000, survey = "line",
##D               unitsIn = "m") 
##D              })
##D 
##D ##compute descriptive stats from data object
##D countDist(ltUMF)
##D      
##D ##Half-normal detection function
##D fm1 <- distsamp(~ 1 ~ 1, ltUMF)
##D ##compute descriptive stats from model object
##D countDist(fm1)
##D }
## End(Not run)



