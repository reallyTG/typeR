library(dagitty)


### Name: VariableStatus
### Title: Variable Statuses
### Aliases: VariableStatus adjustedNodes adjustedNodes<- exposures
###   exposures<- latents latents<- outcomes outcomes<- setVariableStatus

### ** Examples

g <- dagitty("dag{ x<->m<->y<-x }") # m-bias graph
exposures(g) <- "x"
outcomes(g) <- "y"
adjustmentSets(g)




