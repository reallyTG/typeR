library(divDyn)


### Name: ratesplit
### Title: Test of rate split (selectivity)
### Aliases: ratesplit

### ** Examples

# example with the coral dataset of Kiessling and Kocsis (2015)
data(corals)
data(stages)

# split by ecology
  z<-corals[corals$ecology=="z",]
  az<-corals[corals$ecology=="az",]

# calculate diversity dynamics
ddZ<-divDyn(z, tax="genus", bin="stg")
ddAZ<-divDyn(az, tax="genus", bin="stg")

# origination rate plot
tsplot(stages, boxes="sys", shading="series", xlim=54:95, 
  ylab="raw per capita originations")
lines(stages$mid, ddZ$oriPC, lwd=2, lty=1, col="blue")
lines(stages$mid, ddAZ$oriPC, lwd=2, lty=2, col="red")
legend("topright", inset=c(0.1,0.1), legend=c("z", "az"), 
  lwd=2, lty=c(1,2), col=c("blue", "red"), bg="white")

# The ratesplit function
rs<-ratesplit(rbind(z, az), sel="ecology", tax="genus", bin="stg")
rs

# display selectivity with points
# select the higher rates
selIntervals<-cbind(ddZ$oriPC[rs$ori], ddAZ$oriPC[rs$ori])
groupSelector<-apply(selIntervals, 1, function(x) x[1]<x[2])
# draw the points
points(stages$mid[rs$ori[groupSelector]], ddAZ$oriPC[rs$ori[groupSelector]],
  pch=16, col="red", cex=2)
points(stages$mid[rs$ori[!groupSelector]], ddZ$oriPC[rs$ori[!groupSelector]],
  pch=16, col="blue", cex=2)





