## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.width = 7, fig.height = 7--------------------------------------
library(fishtree)

tree <- fishtree_phylogeny(rank = "Tetraodontiformes")

plot(tree, show.tip.label = FALSE, no.margin = TRUE)

## ----fishbase, cache=TRUE------------------------------------------------
library(rfishbase)

tips <- gsub("_", " ", tree$tip.label, fixed = TRUE)

fb_results <- species(species_list = tips, fields = c("Species", "DemersPelag"))
fb_results <- fb_results[!is.na(fb_results$Species), ]
head(fb_results)

## ------------------------------------------------------------------------
reef <- data.frame(tip = gsub(" ", "_", fb_results$Species),
                   is_reef = as.numeric(fb_results$DemersPelag == "reef-associated"))
head(reef)

## ------------------------------------------------------------------------
library(geiger)

rownames(reef) <- reef$tip
nc <- geiger::name.check(tree, reef)
nc

## ------------------------------------------------------------------------
library(ape)
tree <- drop.tip(tree, nc$tree_not_data)

## ------------------------------------------------------------------------
reef <- reef[!rownames(reef) %in% nc$data_not_tree, ]

## ------------------------------------------------------------------------
Ntip(tree) == nrow(reef)

## ------------------------------------------------------------------------
rates <- fishtree_tip_rates(rank = "Tetraodontiformes")
head(rates)

## ------------------------------------------------------------------------
rates <- data.frame(tip = gsub(" ", "_", rates$species), dr = rates$dr)
rownames(rates) <- rates$tip
merged <- merge(reef, rates)

## ---- fig.width = 7, fig.height = 7--------------------------------------
breaks <- seq(min(merged$dr), max(merged$dr), length.out = 30)
hist(subset(merged, is_reef == 1)$dr, col = "orange", density = 20, angle = 135,
     breaks = breaks)
hist(subset(merged, is_reef == 0)$dr, col = "purple", density = 20, angle = 45,
     breaks = breaks, add = TRUE)

## ---- fig.width = 7, fig.height = 7--------------------------------------
# Plot tree and extract plotting data
plot(tree, show.tip.label = FALSE, no.margin = TRUE)
obj <- get("last_plot.phylo", .PlotPhyloEnv)

# Generate a color ramp
ramp <- grDevices::colorRamp(c("black", "red"), bias = 10)
tiporder <- match(rates$tip, tree$tip.label)
scaled_rates <- rates$dr / max(rates$dr, na.rm = TRUE)
tipcols <- apply(ramp(scaled_rates), 1, function(x) do.call(rgb, as.list(x / 255)))

# Place colored bars
for (ii in 1:length(tiporder)) {
    tip <- tiporder[ii]
    lines(x = c(obj$xx[tip] + 0.5, obj$xx[tip] * 1.5 + 0.5 + scaled_rates[ii]),
          y = rep(obj$yy[tip], 2),
          col = tipcols[ii])
}

## ------------------------------------------------------------------------
library(hisse)

## ------------------------------------------------------------------------
trans.rates.bisse <- ParEqual(TransMatMaker(hidden.states = FALSE), c(1, 2))

pp.bisse.full <- hisse(tree, reef, hidden.states = FALSE,
                       turnover.anc = c(1,2,0,0), eps.anc = c(1,1,0,0),
                       trans.rate = trans.rates.bisse, output.type="raw")

pp.bisse.null <- hisse(tree, reef, hidden.states = FALSE,
                       turnover.anc = c(1,1,0,0), eps.anc = c(1,1,0,0),
                       trans.rate = trans.rates.bisse, output.type="raw")

## ------------------------------------------------------------------------
trans.rates.hisse <- TransMatMaker(hidden.states = TRUE)
trans.rates.hisse <- ParDrop(trans.rates.hisse, c(3,5,8,10))
trans.rates.hisse <- ParEqual(trans.rates.hisse, c(1,2,1,3,1,4,1,5,1,6,1,7,1,8))

pp.hisse.full <- hisse(tree, reef, hidden.states = TRUE,
                       turnover.anc=c(1,2,3,4), eps.anc=c(1,1,1,1),
                       trans.rate=trans.rates.hisse, output.type="raw")

## ------------------------------------------------------------------------
pp.hisse.null2 <- hisse(tree, reef, hidden.states = TRUE,
                        turnover.anc=c(1,1,2,2), eps.anc=c(1,1,1,1),
                        trans.rate=trans.rates.hisse, output.type="raw")

## ------------------------------------------------------------------------
results <- list(pp.bisse.full, pp.bisse.null, pp.hisse.null2, pp.hisse.full)
aicc <- sapply(results, `[[`, "AICc")
lnl <- sapply(results, `[[`, "loglik")

data.frame(model = c("bisse_full", "bisse_null", "hisse_cid2", "hisse_full"), aicc, lnl)

