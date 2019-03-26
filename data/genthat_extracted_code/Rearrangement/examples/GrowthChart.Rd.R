library(Rearrangement)


### Name: GrowthChart
### Title: Age and Height of White Males
### Aliases: GrowthChart
### Keywords: datasets

### ** Examples

data(GrowthChart)
attach(GrowthChart)
plot(age,height,pch=21,bg='gray',cex=.5,
xlab="Age (years)",ylab="Height (cms)",col='gray')
detach(GrowthChart)



