library(fBasics)


### Name: ssdFit
### Title: Fit Density Using Smoothing Splines
### Aliases: ssdFit
### Keywords: distribution

### ** Examples
     
## ssdFit -
   set.seed(1953)
   r = rnorm(500)
   hist(r, breaks = "FD", probability = TRUE,
     col = "steelblue", border = "white")
 
## ssdFit - 
   param = ssdFit(r)
   
## dssd -  
   u = seq(min(r), max(r), len = 301)
   v = dssd(u, param)
   lines(u, v, col = "orange", lwd = 2)



