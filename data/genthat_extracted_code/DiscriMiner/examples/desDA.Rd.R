library(DiscriMiner)


### Name: desDA
### Title: Descriptive Discriminant Analysis
### Aliases: desDA

### ** Examples

## Not run: 
##D   # load bordeaux wines dataset
##D   data(bordeaux)
##D 
##D   # descriptive discriminant analysis with within covariance matrix
##D   my_dda1 = desDA(bordeaux[,2:5], bordeaux$quality)
##D   my_dda1
##D 
##D   # descriptive discriminant analysis with total covariance matrix
##D   my_dda2 = desDA(bordeaux[,2:5], bordeaux$quality, covar="total")
##D   my_dda2
##D 
##D   # plot factor coordinates with ggplot
##D   library(ggplot2)
##D   bordeaux$f1 = my_dda1$scores[,1]
##D   bordeaux$f2 = my_dda1$scores[,2]
##D   ggplot(data=bordeaux, aes(x=f1, y=f2, colour=quality)) +
##D   geom_hline(yintercept=0, colour="gray70") +
##D   geom_vline(xintercept=0, colour="gray70") +
##D   geom_text(aes(label=year), size=4) +
##D   opts(title="Discriminant Map - Bordeaux Wines (years)")
##D  
## End(Not run)



