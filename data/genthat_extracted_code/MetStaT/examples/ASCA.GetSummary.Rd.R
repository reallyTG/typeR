library(MetStaT)


### Name: ASCA.GetSummary
### Title: Summary method for ASCA analyses
### Aliases: ASCA.GetSummary
### Keywords: ASCA

### ** Examples

## load the example data
data(ASCAdata)

## Do ASCA on all (both) factors and the interaction between the two factors
ASCA <- ASCA.Calculate(ASCAX, ASCAF, equation.elements = "1,2,12", scaling = TRUE)

## Get a summary of the ASCA results
ASCA.GetSummary(ASCA)



