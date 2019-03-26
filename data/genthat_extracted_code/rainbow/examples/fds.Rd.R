library(rainbow)


### Name: fds
### Title: Create functional objects
### Aliases: fds fts sfts
### Keywords: ts

### ** Examples

fds(x = 1:20, y = Simulationdata$y, xname = "x", yname = "Simulated value")
fts(x = 15:49, y = Australiasmoothfertility$y, xname = "Age", 
    yname = "Fertility rate")
sfts(ts(as.numeric(ElNino$y), frequency = 12), xname = "Month", 
     yname = "Sea surface temperature")    



