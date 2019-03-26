library(RoundAndRound)


### Name: r2d
### Title: Radian to degree
### Aliases: r2d

### ** Examples

r = (1:100)/100 * 4 * pi
d = r2d(r)
rr = d2r(d)
plot(d, sin(rr));
abline(h=0 )
abline(v = 360)



