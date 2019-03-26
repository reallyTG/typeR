library(ETAS)


### Name: resid.etas
### Title: Residuals Analysis and Diagnostics Plots
### Aliases: resid.etas
### Keywords: spatial math earthquake modeling

### ** Examples


  iran.cat <- catalog(iran.quakes, time.begin="1973/01/01",
     study.start="1986/01/01", study.end="2016/01/01",
     lat.range=c(26, 40), long.range=c(44, 63), mag.threshold=5)
  print(iran.cat)
  ## Not run: 
##D   plot(iran.cat)
## End(Not run)

  # setting initial parameter values
  param0 <- c(0.46, 0.23, 0.022, 2.8, 1.12, 0.012, 2.4, 0.35)

  # fitting the model
  ## Not run: 
##D   iran.fit <- etas(iran.cat, param0=param0)
##D 
##D   # diagnostic plots
##D   resid.etas(iran.fit)
## End(Not run)




