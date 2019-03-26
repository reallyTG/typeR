library(rrcov)


### Name: fish
### Title: Fish Catch Data Set
### Aliases: fish
### Keywords: datasets

### ** Examples

    data(fish)

    # remove observation #14 containing missing value
    fish <- fish[-14,]

    # The height and width are calculated as percentages 
    #   of the third length variable
    fish[,5] <- fish[,5]*fish[,4]/100
    fish[,6] <- fish[,6]*fish[,4]/100
 
    # plot a matrix of scatterplots
    pairs(fish[1:6],
          main="Fish Catch Data",
          pch=21,
          bg=c("red", "green3", "blue", "yellow", "magenta", "violet", 
          "turquoise")[unclass(fish$Species)])




