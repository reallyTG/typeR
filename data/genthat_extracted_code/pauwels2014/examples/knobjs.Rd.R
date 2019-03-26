library(pauwels2014)


### Name: knobjs
### Title: Knowledge lists
### Aliases: knobjs
### Keywords: datasets Model specific objects

### ** Examples

data(knobjs)
names(knobjs)

sapply(	
	1:length(knobjs),
	function(k){
		assign(names(knobjs)[k], knobjs[[k]], envir = .GlobalEnv)
	}
)
ls()



