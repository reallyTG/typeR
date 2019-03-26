library(econullnetr)


### Name: generate_edgelist
### Title: Export null modelling results
### Aliases: generate_edgelist

### ** Examples

set.seed(1234)
bs.null <- generate_null_net(Broadstone, Broadstone.prey, data.type = "counts",
                             sims = 10, r.weights = Broadstone.fl)
BS.export <- generate_edgelist(bs.null, signif.level = 0.95)

# Plot network with functions from the cheddar package
library(cheddar)
BS.comm <- list(title = "Broadstone, August", M.units = "mg",
                N.units = "counts")

# Change to lower case to match cheddar convention, then create an object
#  of class 'community'
colnames(BS.export)[1:2] <- c("consumer", "resource")
BS <- Community(nodes = Broadstone.nodes, properties = BS.comm,
                trophic.links = BS.export)

PlotWebByLevel(BS, link.colour.by = "Test", link.colour.spec = c(Stronger =
               "#d7191c", ns = "#cccccc", Weaker = "#2c7bb6"),
               link.lwd = log(TLPS(BS)$Observed), pch = 16, cex = 3,
               col = "black", highlight.nodes = NULL,
               show.nodes.as = "both", label.cex = 1, label.colour = "white")
legend("topright", legend = c("Stronger", "ns", "Weaker"), lty = 1, lwd = 2,
       col = c("#d7191c", "#cccccc", "#2c7bb6"))




