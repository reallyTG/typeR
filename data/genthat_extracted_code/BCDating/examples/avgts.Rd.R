library(BCDating)


### Name: avgts
### Title: TimeSeries averages over cycle phases.
### Aliases: avgts
### Keywords: Averages over Cycle Phases

### ** Examples

data("Iran.non.Oil.GDP.Quarterly.Growth")
data("MBRI.Iran.Dating")
avggrowth <- avgts(Iran.non.Oil.GDP.Quarterly.Growth,MBRI.Iran.Dating)
cbind(avggrowth,Iran.non.Oil.GDP.Quarterly.Growth)
plot(MBRI.Iran.Dating,avggrowth)
plot(MBRI.Iran.Dating,Iran.non.Oil.GDP.Quarterly.Growth,averages=TRUE)












