library(PairedData)


### Name: Barley
### Title: Barley data from Preece (1982, Table 1)
### Aliases: Barley
### Keywords: datasets

### ** Examples

data(Barley)

# Visualizing a clear outlier
with(Barley,plot(paired(Glabron,Velvet),type="BA"))

# Results form the paired t test and paired Yuen test are similar
with(Barley,t.test(paired(Glabron,Velvet)))
with(Barley,yuen.t.test(paired(Glabron,Velvet)))

# Nevertheless the outlier inflates the location (numerator) and
# scale (denominator) standard statictics for the difference
with(Barley,summary(paired(Glabron,Velvet)))



