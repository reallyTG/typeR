library(IMIFA)


### Name: post_conf_mat
### Title: Posterior Confusion Matrix
### Aliases: post_conf_mat
### Keywords: utility

### ** Examples

# data(olive)
# sim  <- mcmc_IMIFA(olive, n.iters=1000)
# res  <- get_IMIFA_results(sim)
# (PCM <- post_conf_mat(res$Clust$post.prob))

# par(mar=c(5.1, 4.1, 4.1, 3.1))
# PCM  <- replace(PCM, PCM == 0, NA)
# plot_cols(mat2cols(PCM, col=heat.colors(30)[30:1], na.col=par()$bg)); box(lwd=2)
# heat_legend(PCM, cols=heat.colors(30)[30:1])
# par(mar=c(5.1, 4.1, 4.1, 2.1))



