library(Rmixmod)


### Name: mixmodCluster
### Title: Create an instance of the ['MixmodCluster'] class
### Aliases: mixmodCluster

### ** Examples

  ## A quantitative example with the famous geyser data set
  data(geyser)
  ## with default values
  mixmodCluster(geyser, nbCluster=2:6)

  ## A qualitative example with the birds data set
  data(birds)
  mixmodCluster(data=birds, nbCluster = 2:5, criterion= c("BIC","ICL","NEC"), 
                model = mixmodMultinomialModel())

  ## use graphics functions
  xem <- mixmodCluster(data=geyser, nbCluster=3)
  ## Not run: 
##D  
##D   plot(xem)
##D   hist(xem)
##D   
## End(Not run)

  ## get summary
  summary(xem)

  ## A composite example with a heterogeneous data set
  data(heterodata)
  mixmodCluster(heterodata,2)




