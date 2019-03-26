library(clusterSim)


### Name: ordinalToMetric
### Title: Reinforcing measurement scale for ordinal data
### Aliases: ordinalToMetric
### Keywords: ordinal scale, GDM distance, reinforcing measurement scale,
###   multivariate statistical analysis

### ** Examples

# Example 1
library(clusterSim)
data(data_patternGDM2)
res1<-ordinalToMetric(data_patternGDM2,scaleType="o",patternCoordinates=c(5,4,3,1,1,3))
print(res1)

# Example 2
library(clusterSim)
data(data_patternGDM2)
res2<-ordinalToMetric(data_patternGDM2,scaleType="o",patternCoordinates=c(5,4,3,4,2,4))
print(res2)



