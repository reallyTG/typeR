library(secr)


### Name: rbind.traps
### Title: Combine traps Objects
### Aliases: rbind.traps
### Keywords: manip

### ** Examples


## nested hollow grids
hollow1 <- make.grid(nx = 8, ny = 8, hollow = TRUE)
hollow2 <- shift(make.grid(nx = 6, ny = 6, hollow = TRUE), 
    c(20, 20))
nested <- rbind (hollow1, hollow2)
plot(nested, gridlines = FALSE, label = TRUE)



