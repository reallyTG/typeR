library(nzelect)


### Name: weight_polls
### Title: Weight polls
### Aliases: weight_polls

### ** Examples

polldates <- tail(unique(polls$MidDate), 20)
weight_polls(polldates, method = "curia", refdate = as.Date("2017-09-22"))
weight_polls(polldates, method = "pundit", refdate = as.Date("2017-09-22"))



