library(meaRtools)


### Name: aggregate_features
### Title: Aggregate Feature Data
### Aliases: aggregate_features
### Keywords: MEA Aggregate

### ** Examples

	data("S")
	data("parameters")
	s<-list()
	s[[1]]<-S
	spike_features = suppressWarnings( aggregate_features(s, "spike", parameters))
	ns_features = suppressWarnings( aggregate_features(s, "ns", parameters) )
	burst_features = suppressWarnings( aggregate_features(s, "burst", parameters) )



