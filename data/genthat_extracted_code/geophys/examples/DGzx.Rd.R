library(geophys)


### Name: DGzx
### Title: Gravity anomaly in 2.5D
### Aliases: DGzx
### Keywords: misc

### ** Examples


nstn = 10
xstart = -10000
xend = 10000
xcen = 0
zcen = 5000
RAD = 2000


xs = seq(from=xstart, by=(xend-xstart)/nstn , length=nstn)
zs = rep(0, length=length(xs))

den = 0.2

Np = 6
theta = seq(from=0, to=2*pi, length=Np)
KZ = list(x=NA, y=NA)
KZ$x = xcen+RAD*cos(theta)
KZ$y = zcen+RAD*sin(theta)




Ngrav = DGzx(xs, zs,  KZ$x, KZ$y, den)







