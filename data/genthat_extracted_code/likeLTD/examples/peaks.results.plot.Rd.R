library(likeLTD)


### Name: peaks.results.plot
### Title: likeLTD::peaks.results.plot
### Aliases: peaks.results.plot

### ** Examples

## Not run: 
##D # datapath to example files
##D datapath = file.path(system.file("extdata", package="likeLTD"),"laboratory")
##D 
##D # File paths and case name for allele report
##D admin = pack.admin.input.peaks(
##D             peaksFile = file.path(datapath, 'laboratory-CSP.csv'),
##D             refFile = file.path(datapath, 'laboratory-reference.csv'),
##D             caseName = "Laboratory",
##D             detectionThresh = 20
##D              )
##D 
##D # Enter arguments
##D args = list(
##D         nUnknowns = 1
##D         )
##D 
##D # Create hypotheses
##D hypP = do.call(prosecution.hypothesis.peaks, append(admin,args))
##D hypD = do.call(defence.hypothesis.peaks, append(admin,args))
##D 
##D # Get parameters for optimisation
##D paramsP = optimisation.params.peaks(hypP)
##D paramsD = optimisation.params.peaks(hypD)
##D 
##D # reduce number of iterations for demonstration purposes
##D paramsP$control$itermax=25
##D paramsD$control$itermax=25
##D 
##D # Run optimisation
##D # n.steps and converge set for demonstration purposes
##D results = evaluate.peaks(paramsP, paramsD, n.steps=1, 
##D       converge=FALSE)
##D 
##D # plot fitted results under prosecution
##D peaks.results.plot(hypP,results$Pros)
##D 
##D # plot fitted results under defence
##D peaks.results.plot(hypD,results$Def)
##D 
##D # plot fitted results for first four loci
##D peaks.results.plot(hypP,results$Pros,toplot=1:4)
## End(Not run)



