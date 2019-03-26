library(pls)


### Name: scoreplot
### Title: Plots of Scores, Loadings and Correlation Loadings
### Aliases: scoreplot scoreplot.default plot.scores loadingplot
###   loadingplot.default plot.loadings corrplot
### Keywords: regression multivariate hplot

### ** Examples

data(yarn)
mod <- plsr(density ~ NIR, ncomp = 10, data = yarn)
## These three are equivalent:
## Not run: 
##D scoreplot(mod, comps = 1:5)
##D plot(scores(mod), comps = 1:5)
##D plot(mod, plottype = "scores", comps = 1:5)
##D 
##D loadingplot(mod, comps = 1:5)
##D loadingplot(mod, comps = 1:5, legendpos = "topright") # With legend
##D loadingplot(mod, comps = 1:5, scatter = TRUE) # Plot as scatterplots
##D 
##D corrplot(mod, comps = 1:2)
##D corrplot(mod, comps = 1:3)
## End(Not run)



