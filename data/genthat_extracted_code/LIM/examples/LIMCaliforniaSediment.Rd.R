library(LIM)


### Name: LIMCaliforniaSediment
### Title: Linear inverse model specification for the Santa Monica Basin
###   sediment food web
### Aliases: LIMCaliforniaSediment
### Keywords: datasets

### ** Examples

CaliforniaSediment <- Flowmatrix(LIMCaliforniaSediment)
plotweb(CaliforniaSediment, main = "Santa Monica Basin Benthic web",
        sub = "mgN/m2/day", lab.size = 0.8)
## Not run: 
##D xr <- LIMCaliforniaSediment$NUnknowns
##D i1 <- 1:(xr/2)
##D i2 <- (xr/2+1):xr
##D Plotranges(LIMCaliforniaSediment, index = i1, lab.cex = 0.7,
##D         sub = "*=unbounded",
##D         main = "Santa Monica Basin Benthic web, Flowranges - part1")
##D Plotranges(LIMCaliforniaSediment, index = i2, lab.cex = 0.7,
##D         sub = "*=unbounded",
##D         main = "Santa Monica Basin Benthic web, Flowranges - part2")
## End(Not run)



