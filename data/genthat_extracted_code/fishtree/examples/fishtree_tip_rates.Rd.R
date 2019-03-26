library(fishtree)


### Name: fishtree_tip_rates
### Title: Get tip rates for the Fish Tree of Life
### Aliases: fishtree_tip_rates

### ** Examples

# Get cichlid rates and trees
rates <- fishtree_tip_rates(rank = "Cichlidae")
tree <- fishtree_phylogeny(rank = "Cichlidae")

# Plot tree and extract plotting data
plot(tree, show.tip.label = FALSE)
obj <- get("last_plot.phylo", ape::.PlotPhyloEnv)

# Generate a color ramp
ramp <- grDevices::colorRamp(c("black", "red"), bias = 10)
tiporder <- match(rates$species, gsub("_", " ", tree$tip.label))
scaled_rates <- rates$lambda.tv / max(rates$lambda.tv, na.rm = TRUE)
tipcols <- apply(ramp(scaled_rates), 1, function(x) do.call(rgb, as.list(x / 255)))

# Place colored bars
for (ii in 1:length(tiporder)) {
    tip <- tiporder[ii]
    lines(x = c(obj$xx[tip] + 0.5, obj$xx[tip] + 0.5 + scaled_rates[ii]),
          y = rep(obj$yy[tip], 2),
          col = tipcols[ii])
}



