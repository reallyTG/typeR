library(StratigrapheR)


### Name: earpoints
### Title: Draws points on an equal area stereonet
### Aliases: earpoints

### ** Examples

earnet()

h <- 17
m <- 11

if(m < 10) a <- "0" else a <- ""

title(paste("Il est ", h, "h",a,m, sep = ""))

i1 <- seq(40, 100, by = 10)
i2 <- seq(0, -100, by = -10)
d1 <- rep(h * 30 + m * 0.5, length(i1))
d2 <- rep(m*6, length(i2))

inc <- c(i1,i2)
dec <- c(d1,d2)

earpoints(dec,inc)




