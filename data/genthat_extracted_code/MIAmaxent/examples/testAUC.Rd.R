library(MIAmaxent)


### Name: testAUC
### Title: Calculate model AUC with test data.
### Aliases: testAUC

### ** Examples

## Not run: 
##D # From vignette:
##D grasslandPA <- readData(
##D   occurrence = system.file("extdata", "occurrence_PA.csv", package="MIAmaxent"),
##D   contEV = system.file("extdata", "EV_continuous", package="MIAmaxent"),
##D   catEV = system.file("extdata", "EV_categorical", package="MIAmaxent"),
##D   PA = TRUE, XY = TRUE)
##D head(grasslandPA)
##D tail(grasslandPA)
##D testAUC(model = grasslandmodel, transformations = grasslandDVs$transformations,
##D         data = grasslandPA)
## End(Not run)




