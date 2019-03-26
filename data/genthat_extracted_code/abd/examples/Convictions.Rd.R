library(abd)


### Name: Convictions
### Title: Frequency of Convictions for a Cohort of English Boys
### Aliases: Convictions
### Keywords: datasets

### ** Examples

str(Convictions)
barchart(boys ~ as.factor(convictions), Convictions, horizontal = FALSE, origin=0)
xyplot( boys ~ convictions, Convictions, type = "h", lwd = 20)



