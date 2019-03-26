library(sorvi)


### Name: regression_plot
### Title: Description: Draw regression curve with smoothed error bars
###   based on the Visually-Weighted Regression by Solomon M. Hsiang; see
###   http://www.fight-entropy.com/2012/07/visually-weighted-regression.html
###   The R implementation is based on Felix Schonbrodt's code from
###   http://www.nicebread.de/visually-weighted-watercolor-plots-new-variants-please-vote/
### Aliases: regression_plot vwReg
### Keywords: utilities

### ** Examples

## Not run: 
##D library(dplyr); library(RColorBrewer);
##D   	     	      library(ggplot2); data(iris);
##D 		      p <- regression_plot(Sepal.Length ~ Sepal.Width, iris)
## End(Not run)



