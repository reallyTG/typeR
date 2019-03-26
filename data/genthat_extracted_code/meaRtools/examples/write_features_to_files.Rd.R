library(meaRtools)


### Name: write_features_to_files
### Title: Write feature data to an output file
### Aliases: write_features_to_files
### Keywords: spikes bursts network features print

### ** Examples

	data("S")
	s<-list()
	s[[1]]<-S
  spike_features = aggregate_features(s, "spike")
  ## No test: 
    write_features_to_files(s, spike_features, analysis$output_dir, "spikes")
  
## End(No test)



