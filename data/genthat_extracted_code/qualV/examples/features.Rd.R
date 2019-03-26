library(qualV)


### Name: features
### Title: Qualitative Features of Time Series
### Aliases: features f.slope f.curve f.steep f.level
### Keywords: misc

### ** Examples

data(phyto)
bbobs    <- dpill(obs$t, obs$y)
n        <- tail(obs$t, n = 1) - obs$t[1] + 1
obsdpill <- ksmooth(obs$t, obs$y, kernel = "normal", bandwidth = bbobs,
            n.points = n)
obss     <- data.frame(t = obsdpill$x, y = obsdpill$y)
obss     <- obss[match(sim$t, obss$t), ]
f.slope(obss$t, obss$y)
f.curve(obss$t, obss$y)
f.steep(obss$t, obss$y, f1 = 30, f2 = 10)
f.level(obss$y)



