library(STAR)


### Name: reportHTML.spikeTrain
### Title: Performs Basic Spike Train Analysis and Generates a Report in
###   HTML Format from a spikeTrain Object
### Aliases: reportHTML.spikeTrain
### Keywords: models smooth regression

### ** Examples

## Not run: 
##D ## load e070528spont data set
##D data(e070528spont)
##D ## perform a standard analysis on neuron 1, looking for cross-correlations
##D ## with the 3 other neurons up to lag +/- 250 ms.
##D ## Store the results under the generic name: e070528spontN1
##D reportHTML(e070528spont[["neuron 1"]],"e070528spontN1",otherST=e070528spont[-1],laglim=c(-1,1)*0.25,forceTT=FALSE)
##D ## Neuron 1 of e070528spont is exceptional in that it can be well
##D ## described by a renewal process...
## End(Not run)



