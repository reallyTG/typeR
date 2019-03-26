library(meaRtools)


### Name: filter_wells
### Title: Filter wells
### Aliases: filter_wells
### Keywords: filter well

### ** Examples

## No test: 

	data("S")
	data("parameters")
	s<-list(); s[[1]]<-S
	spike_features<-aggregate_features(s, feat_type="spike", parameters )
	nae = spike_features$nae
  filtered.spike.features = lapply(spike_features, function(x) filter_wells(x, nae))
## End(No test)



