library(xtractomatic)


### Name: xtracto
### Title: Extract environmental data along a trajectory using ERDDAP.
### Aliases: xtracto

### ** Examples

xpos <- c(230, 235)
ypos <- c(40, 45)
tpos <- c('2006-01-15', '2006-01-20')
xlen <- 0.025
ylen <- 0.025
extract <- xtracto('erdMBsstd8day', xpos, ypos, tpos = tpos, xlen = xlen, ylen = ylen)




