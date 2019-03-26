library(intubate)


### Name: vegan
### Title: Interfaces for vegan package for data science pipelines.
### Aliases: ntbt_adipart ntbt_adonis ntbt_adonis2 ntbt_bioenv
###   ntbt_capscale ntbt_cca ntbt_dbrda ntbt_envfit ntbt_gdispweight
###   ntbt_multipart ntbt_ordicloud ntbt_ordisplom ntbt_ordisurf
###   ntbt_ordixyplot
### Keywords: intubate magrittr vegan adipart adonis adonis2 bioenv
###   capscale cca dbrda envfit gdispweight multipart ordicloud ordisplom
###   ordisurf ordixyplot

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(vegan)
##D 
##D ## There is cheating going on on these examples,
##D ## as the cases need two datasets, and only one
##D ## is being piped... I may get back to this down the line.
##D ## For now, please close an eye.
##D 
##D ## ntbt_adipart: Additive Diversity Partitioning and Hierarchical Null Model Testing
##D data(mite)
##D data(mite.xy)
##D ## Function to get equal area partitions of the mite data
##D cutter <- function (x, cut = seq(0, 10, by = 2.5)) {
##D     out <- rep(1, length(x))
##D     for (i in 2:(length(cut) - 1))
##D         out[which(x > cut[i] & x <= cut[(i + 1)])] <- i
##D     return(out)}
##D ## The hierarchy of sample aggregation
##D levsm <- with(mite.xy, data.frame(
##D     l1=1:nrow(mite),
##D     l2=cutter(y, cut = seq(0, 10, by = 2.5)),
##D     l3=cutter(y, cut = seq(0, 10, by = 5)),
##D     l4=cutter(y, cut = seq(0, 10, by = 10))))
##D 
##D ## Original function to interface
##D set.seed(1)
##D adipart(mite ~ ., levsm, index="richness", nsimul=19)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_adipart(levsm, mite ~ ., index="richness", nsimul=19)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D levsm %>%
##D   ntbt_adipart(mite ~ ., index="richness", nsimul=19)
##D 
##D 
##D ## ntbt_adonis: Permutational Multivariate Analysis of Variance Using Distance Matrices
##D data(dune)
##D data(dune.env)
##D 
##D ## Original function to interface
##D set.seed(1)
##D adonis(dune ~ Management*A1, data = dune.env)
##D adonis2(dune ~ Management*A1, data = dune.env)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_adonis(dune.env, dune ~ Management*A1)
##D ntbt_adonis2(dune.env, dune ~ Management*A1)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D dune.env %>%
##D   ntbt_adonis(dune ~ Management*A1)
##D dune.env %>%
##D   ntbt_adonis2(dune ~ Management*A1)
##D 
##D 
##D ## ntbt_bioenv: Best Subset of Environmental Variables with
##D ##              Maximum (Rank) Correlation with Community Dissimilarities
##D data(varespec)
##D data(varechem)
##D 
##D ## Original function to interface
##D bioenv(wisconsin(varespec) ~ log(N) + P + K + Ca + pH + Al, varechem)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bioenv(varechem, wisconsin(varespec) ~ log(N) + P + K + Ca + pH + Al)
##D 
##D ## so it can be used easily in a pipeline.
##D varechem %>%
##D   ntbt_bioenv(wisconsin(varespec) ~ log(N) + P + K + Ca + pH + Al)
##D 
##D 
##D ## ntbt_capscale: [Partial] Distance-based Redundancy Analysis
##D ## ntbt_dbrda:
##D ## Original function to interface
##D capscale(varespec ~ N + P + K + Condition(Al), varechem,
##D          dist="bray")
##D dbrda(varespec ~ N + P + K + Condition(Al), varechem,
##D          dist="bray")
##D 
##D ## The interface puts data as first parameter
##D ntbt_capscale(varechem, varespec ~ N + P + K + Condition(Al), 
##D               dist="bray")
##D ntbt_dbrda(varechem, varespec ~ N + P + K + Condition(Al), 
##D            dist="bray")
##D 
##D ## so it can be used easily in a pipeline.
##D varechem %>%
##D   ntbt_capscale(varespec ~ N + P + K + Condition(Al), dist="bray")
##D varechem %>%
##D   ntbt_dbrda(varespec ~ N + P + K + Condition(Al), dist="bray")
##D 
##D 
##D ## ntbt_cca: [Partial] [Constrained] Correspondence Analysis
##D ##           and Redundancy Analysis
##D 
##D ## Original function to interface
##D cca(varespec ~ Al + P*(K + Baresoil), data = varechem)
##D 
##D ## The interface puts data as first parameter
##D ntbt_cca(varechem, varespec ~ Al + P*(K + Baresoil))
##D 
##D ## so it can be used easily in a pipeline.
##D varechem %>%
##D   ntbt_cca(varespec ~ Al + P*(K + Baresoil))
##D 
##D 
##D ## ntbt_gdispweight: Dispersion-based weighting of species counts
##D data(mite, mite.env)
##D ## Original function to interface
##D gdispweight(mite ~ Shrub + WatrCont, data = mite.env)
##D 
##D ## The interface puts data as first parameter
##D ntbt_gdispweight(mite.env, mite ~ Shrub + WatrCont)
##D 
##D ## so it can be used easily in a pipeline.
##D mite.env %>%
##D   ntbt_gdispweight(mite ~ Shrub + WatrCont)
##D 
##D 
##D ## ntbt_envfit: Fits an Environmental Vector or Factor onto an Ordination
##D ord <- cca(dune)
##D 
##D ## Original function to interface
##D envfit(ord ~ Moisture + A1, dune.env, perm = 0)
##D 
##D ## The interface puts data as first parameter
##D ntbt_envfit(dune.env, ord ~ Moisture + A1, perm = 0)
##D 
##D ## so it can be used easily in a pipeline.
##D dune.env %>%
##D   ntbt_envfit(ord ~ Moisture + A1, perm = 0)
##D 
##D ## ntbt_multipart: Multiplicative Diversity Partitioning
##D ## Original function to interface
##D multipart(mite ~ ., levsm, index = "renyi", scales = 1, nsimul = 19)
##D 
##D ## The interface puts data as first parameter
##D ntbt_multipart(levsm, mite ~ ., index = "renyi", scales = 1, nsimul = 19)
##D 
##D ## so it can be used easily in a pipeline.
##D levsm %>%
##D   ntbt_multipart(mite ~ ., index = "renyi", scales = 1, nsimul = 19)
##D 
##D 
##D ## ntbt_ordisurf: Fit and Plot Smooth Surfaces of Variables on Ordination.
##D vare.dist <- vegdist(varespec)
##D vare.mds <- monoMDS(vare.dist)
##D 
##D ## Original function to interface
##D ordisurf(vare.mds ~ Baresoil, varechem, bubble = 5)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ordisurf(varechem, vare.mds ~ Baresoil, bubble = 5)
##D 
##D ## so it can be used easily in a pipeline.
##D varechem %>%
##D   ntbt_ordisurf(vare.mds ~ Baresoil, bubble = 5)
##D 
##D 
##D ## ntbt_ordixyplot: Trellis (Lattice) Plots for Ordination
##D ## Original function to interface
##D ordicloud(ord, form = CA2 ~ CA3*CA1, groups = Manure, data = dune.env)
##D ordisplom(ord, data = dune.env, form = ~ . | Management, groups=Manure)
##D ordixyplot(ord, data=dune.env, form = CA1 ~ CA2 | Management, groups=Manure)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ordicloud(dune.env, ord, form = CA2 ~ CA3*CA1, groups = Manure)
##D ntbt_ordisplom(dune.env, ord, form = ~ . | Management, groups=Manure)
##D ntbt_ordixyplot(dune.env, ord, form = CA1 ~ CA2 | Management, groups=Manure)
##D 
##D ## so it can be used easily in a pipeline.
##D dune.env %>%
##D   ntbt_ordicloud(ord, form = CA2 ~ CA3*CA1, groups = Manure)
##D dune.env %>%
##D   ntbt_ordisplom(ord, form = ~ . | Management, groups=Manure)
##D dune.env %>%
##D   ntbt_ordixyplot(ord, form = CA1 ~ CA2 | Management, groups=Manure)
## End(Not run)



