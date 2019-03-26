library(MachineLearning)


### Name: CREA.RBS
### Title: An expert rule based system using Reduction Based on
###   Significance
### Aliases: CREA.RBS

### ** Examples

## Load a Dataset
data(EGATUR)
## Generate a CREA-RBS model, remmember only support discretized variables
CREA.RBS(GastoTotalD~pais+aloja+motivo,data=EGATUR)






