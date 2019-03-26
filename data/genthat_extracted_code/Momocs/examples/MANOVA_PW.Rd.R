library(Momocs)


### Name: MANOVA_PW
### Title: Pairwise Multivariate analyses of variance
### Aliases: MANOVA_PW MANOVA_PW.PCA

### ** Examples

# we create a fake factor with 4 levels
bot$fac$fake <- factor(rep(letters[1:4], each=10))
bot.p <- PCA(efourier(bot, 8))
MANOVA_PW(bot.p, 'fake') # or MANOVA_PW(bot.p, 2)

# an example on open outlines
op <- PCA(npoly(olea))
MANOVA_PW(op, 'domes')
# to get the results
res <- MANOVA_PW(op, 'domes')
res$manovas
res$stars.tab
res$summary



