library(dfphase1)


### Name: shewhart
### Title: Univariate Shewhart-type control charts
### Aliases: shewhart shewhart.normal.limits
### Keywords: htest statistical process monitoring statistical process
###   control distribution-free methods

### ** Examples

# A simulated example
set.seed(12345)
y <- matrix(rt(100,3),5)
y[,20] <- y[,20]+3
shewhart(y)
# Reproduction of the control charts shown
# by Jones-Farmer et. al. (2009,2010)
data(colonscopy)
u <- shewhart.normal.limits(NROW(colonscopy),NCOL(colonscopy),stat="lRank",FAP=0.1)
u
# control limits based on a limited number of replications
# to avoid a (relatively) long execution time
shewhart(colonscopy,stat="lRank",limits=u,L=10000)
shewhart(colonscopy,stat="sRank",FAP=0.1,L=10000)



