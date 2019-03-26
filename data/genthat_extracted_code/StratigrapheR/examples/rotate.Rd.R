library(StratigrapheR)


### Name: rotate
### Title: Spherical rotation around fixed axes
### Aliases: rotate

### ** Examples

earnet()

inc <- seq(0,85,5)
dec <- rep(0,length(inc))

earpoints(dec,inc)

rdec <- rep(0, length(inc))
rinc <- rep(90, length(inc))

mag <- 90
rmag  <- seq(mag, 0, by = -mag/(length(inc)-1))

rot <- rotate(dec,inc,rdec,rinc,rmag)

earpoints(dec = round(rot$dec,digits = 2), inc = round(rot$inc,digits = 2),
          l = list(bg = "green"),
          u = list(bg = "blue"),
          h = list(bg = "yellow"))

earpoints(dec = 0, inc = 90, l = list(bg = "red"))




