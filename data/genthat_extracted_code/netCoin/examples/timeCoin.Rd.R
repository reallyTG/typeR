library(netCoin)


### Name: timeCoin
### Title: Networked coincidences.
### Aliases: timeCoin

### ** Examples

# Database of 19th century sociologists
data(sociologists)
timeCoin(sociologists,"name","birth","death","birthcountry", 
         dir = "./timeline", show = FALSE) # See ./timeline/index.html file



