library(dagitty)


### Name: plotLocalTestResults
### Title: Plot Results of Local Tests
### Aliases: plotLocalTestResults

### ** Examples

d <- simulateSEM("dag{X->{U1 M2}->Y U1->M1}",.6,.6)
par(mar=c(2,8,1,1)) # so we can see the test names
plotLocalTestResults(localTests( "dag{ X -> {M1 M2} -> Y }", d, "cis" ))




