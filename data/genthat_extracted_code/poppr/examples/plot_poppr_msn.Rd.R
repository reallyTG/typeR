library(poppr)


### Name: plot_poppr_msn
### Title: Plot minimum spanning networks produced in poppr.
### Aliases: plot_poppr_msn

### ** Examples

# Using a data set of the Aphanomyces eutieches root rot pathogen.
data(Aeut)
adist <- diss.dist(Aeut, percent = TRUE)
amsn <- poppr.msn(Aeut, adist, showplot = FALSE)

# Default
library("igraph") # To get all the layouts.
set.seed(500)
plot_poppr_msn(Aeut, amsn, gadj = 15)

## Not run: 
##D 
##D # Different layouts (from igraph) can be used by supplying the function name.
##D set.seed(500)
##D plot_poppr_msn(Aeut, amsn, gadj = 15, layfun = layout_with_kk)
##D 
##D # Removing link between populations (cutoff = 0.2) and labelling no individuals
##D set.seed(500)
##D plot_poppr_msn(Aeut, amsn, inds = "none", gadj = 15, beforecut = TRUE, cutoff = 0.2)
##D 
##D # Labelling individual #57 because it is an MLG that crosses populations
##D # Showing clusters of MLGS with at most 5% variation
##D # Notice that the Mt. Vernon population appears to be more clonal
##D set.seed(50) 
##D plot_poppr_msn(Aeut, amsn, gadj = 15, cutoff = 0.05, inds = "057")
##D 
##D 
##D data(partial_clone)
##D pcmsn <- bruvo.msn(partial_clone, replen = rep(1, 10))
##D 
##D # You can plot using a color palette or a vector of named colors
##D # Here's a way to define the colors beforehand
##D pc_colors <- nPop(partial_clone) %>% 
##D   RColorBrewer::brewer.pal("Set2") %>% 
##D   setNames(popNames(partial_clone))
##D 
##D pc_colors
##D 
##D # Labelling the samples contained in multilocus genotype 9
##D set.seed(999)
##D plot_poppr_msn(partial_clone, pcmsn, palette = pc_colors, inds = 9)
##D 
##D # Doing the same thing, but using one of the sample names as input.
##D set.seed(999)
##D plot_poppr_msn(partial_clone, pcmsn, palette = pc_colors, inds = "sim 20")
##D 
##D # Note that this is case sensitive. Nothing is labeled. 
##D set.seed(999)
##D plot_poppr_msn(partial_clone, pcmsn, palette = pc_colors, inds = "Sim 20")
##D 
##D # Something pretty
##D data(microbov)
##D mdist <- diss.dist(microbov, percent = TRUE)
##D micmsn <- poppr.msn(microbov, mdist, showplot = FALSE)
##D 
##D plot_poppr_msn(microbov, micmsn, palette = "terrain.colors", inds = "n", 
##D   quantiles = FALSE)
##D plot_poppr_msn(microbov, micmsn, palette = "terrain.colors", inds = "n", 
##D   cutoff = 0.3, quantiles = FALSE)
##D   
##D ### Utilizing vectors for palettes
##D 
##D data(Pram)
##D Pram_sub <- popsub(Pram, blacklist = c("Nursery_CA", "Nursery_OR"))
##D 
##D # Creating the network for the forest
##D min_span_net_sub <- bruvo.msn(Pram_sub, replen = other(Pram)$REPLEN, 
##D                               add = TRUE, loss = TRUE, showplot = FALSE, 
##D                               include.ties = TRUE)
##D                               
##D # Creating the network with nurseries
##D min_span_net     <- bruvo.msn(Pram, replen = other(Pram)$REPLEN, 
##D                               add = TRUE, loss = TRUE, showplot = FALSE, 
##D                               include.ties = TRUE)
##D 
##D # Only forest genotypes
##D set.seed(70)
##D plot_poppr_msn(Pram,
##D                min_span_net_sub,
##D                inds = "ALL",
##D                mlg = TRUE,
##D                gadj = 9,
##D                nodescale = 5,
##D                palette = other(Pram)$comparePal,
##D                cutoff = NULL,
##D                quantiles = FALSE,
##D                beforecut = TRUE)
##D 
##D # With Nurseries
##D set.seed(70)
##D plot_poppr_msn(Pram,
##D                min_span_net,
##D                inds = "ALL",
##D                mlg = TRUE,
##D                gadj = 9,
##D                nodescale = 5,
##D                palette = other(Pram)$comparePal,
##D                cutoff = NULL,
##D                quantiles = FALSE,
##D                beforecut = TRUE)
## End(Not run)



