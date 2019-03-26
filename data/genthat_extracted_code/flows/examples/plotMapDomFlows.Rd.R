library(flows)


### Name: plotMapDomFlows
### Title: Dominant Flows Map
### Aliases: plotMapDomFlows

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

# Node weights
inflows <- data.frame(id = colnames(myflows), w = colSums(myflows))

# Plot dominant flows map
opar <- par(mar = c(0,0,2,0))
sp::plot(GE, col = "#cceae7", border = NA)
plotMapDomFlows(mat = flowSel, spdf = UA, spdfid = "ID", w = inflows, wid = "id",
                wvar = "w", wcex = 0.05, add = TRUE,
                legend.flows.pos = "bottomleft",
                legend.flows.title = "Nb. of commuters")
title("Dominant Flows of Commuters")
mtext(text = "INSEE, 2011", side = 4, line = -1, adj = 0.01, cex = 0.8)
par(opar)



