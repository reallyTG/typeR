library(mvabund)


### Name: manylm
### Title: Fitting Linear Models for Multivariate Abundance Data
### Aliases: manylm
### Keywords: models multivariate regression

### ** Examples

data(spider)
spiddat <- log(spider$abund+1)
spiddat <- mvabund(spiddat)
X <- spider$x

lm.spider <- manylm(spiddat~X)
lm.spider

#Then use the plot function for diagnostic plots, and use anova or summary to
#evaluate significance of different model terms.



