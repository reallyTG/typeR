library(pauwels2014)


### Name: read_knobjs
### Title: Summarizes pre-computed results.
### Aliases: read_knobjs
### Keywords: package

### ** Examples

data(knobjs)
data(exps)
sapply(	
	1:length(knobjs),
	function(k){
		assign(names(knobjs)[k], knobjs[[k]], envir = .GlobalEnv)
	}
)

read_knobjs(paste("knobjActMult", 1:10, sep=""))



