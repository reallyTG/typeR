library(mirt)


### Name: areainfo
### Title: Function to calculate the area under a selection of information
###   curves
### Aliases: areainfo
### Keywords: area information

### ** Examples


dat <- expand.table(LSAT7)
mod <- mirt(dat, 1)

areainfo(mod, c(-2,0), which.items = 1) #item 1
## Not run: 
##D areainfo(mod, c(-2,0), which.items = 1:3) #items 1 to 3
##D areainfo(mod, c(-2,0)) # all items (total test information)
##D 
##D # plot the area
##D area <- areainfo(mod, c(-2,0))
##D Theta <- matrix(seq(-3,3, length.out=1000))
##D info <- testinfo(mod, Theta)
##D plot(info ~ Theta, type = 'l')
##D 
##D pick <- Theta >= -2 & Theta <=0
##D polygon(c(-2, Theta[pick], 0), c(0, info[pick], 0), col='lightblue')
##D text(x = 2, y = 0.5, labels = paste("Total Information:", round(area$TotalInfo, 3),
##D            "\n\nInformation in (-2, 0):", round(area$Info, 3),
##D            paste("(", round(100 * area$Proportion, 2), "%)", sep = "")), cex = 1.2)
##D 
## End(Not run)



