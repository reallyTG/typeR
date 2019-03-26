library(MSCMT)


### Name: improveSynth
### Title: Check (and Improve) Results of Package Synth
### Aliases: improveSynth

### ** Examples

## Not run: 
##D ## check whether package 'Synth' is available
##D if (require("Synth")) {
##D 
##D ## process first example of function "synth" in package 'Synth' 
##D ## (comments are removed):
##D 
##D   data(synth.data)
##D   dataprep.out<-
##D     dataprep(
##D      foo = synth.data,
##D      predictors = c("X1", "X2", "X3"),
##D      predictors.op = "mean",
##D      dependent = "Y",
##D      unit.variable = "unit.num",
##D      time.variable = "year",
##D      special.predictors = list(
##D         list("Y", 1991, "mean"),
##D         list("Y", 1985, "mean"),
##D         list("Y", 1980, "mean")
##D                               ),
##D      treatment.identifier = 7,
##D      controls.identifier = c(29, 2, 13, 17, 32, 38),
##D      time.predictors.prior = c(1984:1989),
##D      time.optimize.ssr = c(1984:1990),
##D      unit.names.variable = "name",
##D      time.plot = 1984:1996
##D      )
##D 
##D   synth.out <- synth(dataprep.out)
##D 
##D ## check and (try to) improve these results:
##D   synth2.out <- improveSynth(synth.out,dataprep.out)
##D }
## End(Not run)



