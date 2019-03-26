library(RoundAndRound)


### Name: d2r
### Title: Degree to Radian
### Aliases: d2r

### ** Examples

r = (1:100)/100 * 4 * pi
d = r2d(r)
rr = d2r(d)
plot(d, sin(rr));
abline(h=0 )
abline(v = 360)



