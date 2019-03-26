library(likeLTD)


### Name: output.report
### Title: likeLTD::output.report
### Aliases: output.report

### ** Examples

## Not run: 
##D # datapath to example files
##D datapath = file.path(system.file("extdata", package="likeLTD"),"hammer")
##D 
##D # File paths and case name for allele report
##D admin = pack.admin.input(
##D             cspFile = file.path(datapath, 'hammer-CSP.csv'),
##D             refFile = file.path(datapath, 'hammer-reference.csv'),
##D             caseName = "hammer",
##D 	    kit= "SGMplus"
##D              )
##D 
##D # Enter arguments
##D args = list(
##D         nUnknowns = 1,
##D         doDropin = FALSE,
##D         ethnic = "EA1",
##D         adj = 1,
##D         fst = 0.02,
##D         relatedness = c(0,0)
##D         )
##D 
##D # Create hypotheses
##D hypP = do.call(prosecution.hypothesis, append(admin,args))
##D hypD = do.call(defence.hypothesis, append(admin,args))
##D 
##D # Get parameters for optimisation
##D paramsP = optimisation.params(hypP)
##D paramsD = optimisation.params(hypD)
##D 
##D # Run optimisation
##D # n.steps set for demonstration purposes
##D results = evaluate(paramsP, paramsD, n.steps=1)
##D 
##D # Generate output report
##D output.report(hypP,hypD,results)
## End(Not run)



