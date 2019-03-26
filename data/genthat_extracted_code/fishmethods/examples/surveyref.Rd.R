library(fishmethods)


### Name: surveyref
### Title: Quantitative reference points from stock abundance indices based
###   on research surveys
### Aliases: surveyref
### Keywords: misc

### ** Examples

data(wolffish)
out<-surveyfit(year=wolffish$year,index=wolffish$index,logtrans=TRUE)
surveyref(out,refpt=25,compyear=c(1990))



