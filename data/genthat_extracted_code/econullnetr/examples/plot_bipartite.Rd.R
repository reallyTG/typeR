library(econullnetr)


### Name: plot_bipartite
### Title: Plot a bipartite network, colour coding individual links
###   according to whether they are stronger or weaker than expected under
###   the null model
### Aliases: plot_bipartite

### ** Examples


# Run the null model
set.seed(1234)
sil.null <- generate_null_net(Silene[, 2:7], Silene.plants[, 2:6], sims = 10,
                              c.samples = Silene[, 1],
                              r.samples = Silene.plants[, 1])

# Basic plot
plot_bipartite(sil.null)

# With alternative colour scheme and nodes width in the lower level proportional
#  to mean floral abundance
mean.abunds <- colMeans(Silene.plants[, 2:6])
plot_bipartite(sil.null, signif.level = 0.95, edge.cols = c("#67a9cf",
               "#F7F7F7", "#ef8a62"), low.abun = mean.abunds,
               abuns.type = "independent", low.abun.col = "black",
               high.abun.col = "black", high.lablength = 0, low.lablength = 0)




