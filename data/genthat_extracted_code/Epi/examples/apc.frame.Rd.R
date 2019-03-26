library(Epi)


### Name: apc.frame
### Title: Produce an empty frame for display of parameter-estimates from
###   Age-Period-Cohort-models.
### Aliases: apc.frame
### Keywords: hplot

### ** Examples

par( mar=c(4,4,1,4) )
res <-
apc.frame( a.lab=seq(30,90,20), cp.lab=seq(1880,2000,30), r.lab=c(1,2,5,10,20,50),
           a.tic=seq(30,90,10), cp.tic=seq(1880,2000,10), r.tic=c(1:10,1:5*10),
           gap=27 )
res
# What are the axes actually?
par(c("usr","xlog","ylog"))
# How to plot in the age-part: a point at (50,10)
points( 50, 10, pch=16, cex=2, col="blue" )
# How to plot in the cohort-period-part: a point at (1960,0.3)
points( 1960-res[1], 0.3*res[2], pch=16, cex=2, col="red" )
# or referring to the period-cohort part of the plot 
pc.points( 1960, 0.3, pch=16, cex=1, col="green" )



