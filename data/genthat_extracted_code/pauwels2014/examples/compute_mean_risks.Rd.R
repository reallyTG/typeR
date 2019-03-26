library(pauwels2014)


### Name: compute_mean_risks
### Title: Compute an average risk as a function of credit spent
### Aliases: compute_mean_risks
### Keywords: Optimization functions

### ** Examples

	data(knobjs)
	sapply(	
		1:length(knobjs),
		function(k){
			assign(names(knobjs)[k], knobjs[[k]], envir = .GlobalEnv)
		}
	)

	data(exps)
	temp <- read_knobjs(paste("knobjActMult", 1:10, sep=""))
	mean_risks <- compute_mean_risks(temp, "A title")
	mean_risks




