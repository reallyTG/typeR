library(strucchange)


### Name: plot.Fstats
### Title: Plot F Statistics
### Aliases: plot.Fstats lines.Fstats
### Keywords: hplot

### ** Examples

## Load dataset "nhtemp" with average yearly temperatures in New Haven
data("nhtemp")
## plot the data
plot(nhtemp)

## test the model null hypothesis that the average temperature remains
## constant over the years for potential break points between 1941
## (corresponds to from = 0.5) and 1962 (corresponds to to = 0.85)
## compute F statistics
fs <- Fstats(nhtemp ~ 1, from = 0.5, to = 0.85)
## plot the F statistics
plot(fs, alpha = 0.01)
## and the corresponding p values
plot(fs, pval = TRUE, alpha = 0.01)
## perform the aveF test
sctest(fs, type = "aveF")



