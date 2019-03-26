library(ETAS)


### Name: rates
### Title: Declustering Probabilities, Background Seismicity Rate and
###   Clustering Coefficient
### Aliases: rates probs
### Keywords: spatial math earthquake modeling

### ** Examples


  # preparing the catalog
  iran.cat <- catalog(iran.quakes, time.begin="1973/01/01",
     study.start="1996/01/01", study.end="2016/01/01",
     lat.range=c(25, 42), long.range=c(42, 63), mag.threshold=4.5)

  print(iran.cat)
  ## Not run: 
##D   plot(iran.cat)
## End(Not run)

  # initial parameters values
  param01 <- c(0.46, 0.23, 0.022, 2.8, 1.12, 0.012, 2.4, 0.35)

  # fitting the model and
  ## Not run: 
##D   iran.fit <- etas(iran.cat, param0=param01)
## End(Not run)

  # estimating the declustering probabilities
  ## Not run: 
##D   pr <- probs(iran.fit)
##D   plot(iran.cat$longlat.coord[,1:2], cex=2 * (1 - pr$prob))
## End(Not run)

  # estimating the  background seismicity rate and clustering coefficient
  ## Not run: 
##D   rates(iran.fit, dimyx=c(100, 125))
##D   iran.rates <- rates(iran.fit, dimyx=c(200, 250), plot.it=FALSE)
##D   summary(iran.rates$background)
## End(Not run)



