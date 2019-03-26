library(meaRtools)


### Name: permute_features_and_plot
### Title: Write PDF
### Aliases: permute_features_and_plot
### Keywords: MEA analysis PDF

### ** Examples

## No test: 
	data("S")
	spike_features<-aggregate_features(S, feat_type="spike" )
	wt <- "untreated"
	output_dir = tempdir()
  print(paste0("Creating output folders under ",output_dir))
	permute_features_and_plot(S, wt, np, spike_features, "spikes", output_dir)
## End(No test)



