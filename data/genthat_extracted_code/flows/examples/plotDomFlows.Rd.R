library(flows)


### Name: plotDomFlows
### Title: Dominant Flows Graph
### Aliases: plotDomFlows

### ** Examples

# Import data
data(nav)
myflows <- prepflows(mat = nav, i = "i", j = "j", fij = "fij")

# Remove the matrix diagonal
diag(myflows) <- 0

# Select the dominant flows (incoming flows criterion)
flowSel1 <- domflows(mat = myflows, w = colSums(myflows), k = 1)
# Select the first flows
flowSel2 <- firstflows(mat = myflows, method = "nfirst", ties.method = "first",
                       k = 1)

# Combine selections
flowSel <- myflows * flowSel1 * flowSel2

# Plot dominant flows graph
plotDomFlows(mat = flowSel, legend.flows.title = "Nb. of commuters")



