library(PEIP)


### Name: vspprofile
### Title: Vertical Seismic Profile In 1D
### Aliases: vspprofile
### Keywords: misc

### ** Examples


V = vspprofile()
### plot quadratic velocity profile
plot(V$vee, -V$depth, main="VSP: velocity increasing with depth")
dobs = seq(from=V$deltobs, to=V$maxdepth, by=V$deltobs)
### plotdepth versus time (not linear)
plot(dobs, V$t2)
abline(lm(V$t2 ~ dobs) )





