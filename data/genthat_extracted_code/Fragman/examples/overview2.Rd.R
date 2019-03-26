library(Fragman)


### Name: overview2
### Title: Assesing several plants with an overview
### Aliases: overview2

### ** Examples

data(my.plants)
my.plants <- my.plants[1]
my.ladder <- c(50, 75, 100, 125, 129, 150, 175, 200, 225, 250, 275, 300, 325, 350, 375)
overview2(my.inds=my.plants, channel = 1, ladder=my.ladder, lwd=1)
# now use:
# my.panel <- locator(type="p", pch=20, col="red")$x
# to click over the peaks and get the sizes in base pairs
# when you are done make sure you press the "Esc" key, do not push the stop button

## to look at many channels at the same time you 
## can use the par(new=TRUE) and a for loop

for(u in 1:4){
  overview2(my.inds=my.plants, channel = u, ladder=my.ladder, lwd=1,
            xlim=c(240,350), ylim=c(0,30000))
  par(new=TRUE)
}




