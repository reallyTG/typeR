library(ddalpha)


### Name: dataf.geneexp
### Title: Gene Expression Profile Data
### Aliases: dataf.geneexp geneexp
### Keywords: datasets functional

### ** Examples

## load the dataset
dataf = dataf.geneexp()

## view the classes
unique(dataf$labels)

## access the 5th point of the 2nd object
dataf$dataf[[2]]$args[5]
dataf$dataf[[2]]$vals[5]

## plot the data
## Not run: 
##D labels = unlist(dataf$labels)
##D plot(dataf, 
##D   xlab="Time", ylab="Gene Expression Level", 
##D   main=paste0("Gene Expression:  1 red (", sum(labels == 1), "), ", 
##D             "2 green (", sum(labels == 2), "), ", 
##D             "3 blue (", sum(labels == 3), ")"),
##D   colors = c("red", "green", "blue"))
## End(Not run)



