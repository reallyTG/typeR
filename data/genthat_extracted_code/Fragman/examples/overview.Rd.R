library(Fragman)


### Name: overview
### Title: Assesing several plants with an overview
### Aliases: overview

### ** Examples

data(my.plants)
my.plants <- my.plants[1:10]
my.ladder <- c(50, 75, 100, 125, 129, 150, 175, 200, 225, 250, 275, 300, 325, 350, 375)
overview(my.inds=my.plants, channel = 1, n.inds = c(1:5), ladder=my.ladder, xlim=c(200,220))
# now use:
# locator(type="p", pch=20, col="red")$x
# to click over the peaks and get the sizes in base pairs
# when you are done make sure you press the "Esc" key, 
# do not push the stop button, some versions of R usually crash 
# by stopping instead of pressing 'Esc'.



