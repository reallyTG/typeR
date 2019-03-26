library(fitDRC)


### Name: drclass
### Title: The class 'drclass' in the fitDRC-package: its constructors and
###   methods.
### Aliases: drclass drclass.create print.drclass summary.drclass
###   plot.drclass Kappa.drclass Lambda.drclass metrics.drclass
###   metric.ci.drclass metric.width.drclass metric.shape.drclass
###   metric.mode.drclass
### Keywords: distribution

### ** Examples

drc <- drclass.create (p = c(0.05,0.25,0.666,0.75,0.95),
                       q = qnorm(c(0.05,0.25,0.5,0.75,0.95)),
                       dist.lower = dist.normal.create(c(0,1)),
                       dist.upper = dist.normal.create(c(0,1)))
drc
print(drc)   # prints the Density Ratio Class.
#summary(drc) # adds the metrics.
#plot(drc)    # plots the Density Ratio Class.

Kappa(drc)
Lambda(drc)

#metrics(drc) # all metrics.
#metric.ci(drc, 0.1) # outer credible interval for 0.9 content

#####################################################################################
### if you want to create your own Density Ratio Class use the following template ###
#####################################################################################

# drclass.create <- function(p = c(yourProbabilities),    # according to q
#                           q = qnorm(c(yourQuantiles)),  # according to p
#                           dist.lower = dist.yourDistribution.create(par),
#                           dist.upper = dist. yourDistribution.create(par)  )
# {
#
# drc                      <- list()
# drc$name                 <- "yourDRCname"
# drc$range                <- dist.upper$range(dist.upper$par) 
# drc$p                    <- p
# drc$q                    <- q
# drc$dist.lower           <- dist.lower
# drc$dist.upper           <- dist.upper
# class(drc)               <- "drclass"
# return(drc)
# }




