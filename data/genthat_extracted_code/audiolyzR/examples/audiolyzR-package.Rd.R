library(audiolyzR)


### Name: audiolyzR-package
### Title: audiolyzR: Listen to your data
### Aliases: audiolizR-package audiolyzR audiolyzer Audiolyzer audiolyzr
###   Audiolyzr audiolyzeR audiolizer audiolizeR Audiolizer
###   audiolisR-package audiolysR audiolyser Audiolyser audiolysr Audiolysr
###   audiolyseR audioliser audioliseR Audioliser
### Keywords: sonification

### ** Examples

##Basic audiolyzR examples
data(NHANES)

## Not run: 
##D ##Scatter Plot
##D audioScatter(BMI ~ Weight,data=NHANES)
##D 
##D ##Scatterplot matrix
##D audioSplom(data=NHANES, bins=20)
##D 
##D ##Histogram
##D audioHist(NHANES$Weight, name="Weight")
## End(Not run)



