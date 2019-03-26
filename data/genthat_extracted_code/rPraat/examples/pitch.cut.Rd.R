library(rPraat)


### Name: pitch.cut
### Title: pitch.cut
### Aliases: pitch.cut

### ** Examples

pitch <- pitch.sample()
pitch2 <-   pitch.cut(pitch,  tStart = 3)
pitch2_0 <- pitch.cut0(pitch, tStart = 3)
pitch3 <-   pitch.cut(pitch,  tStart = 2, tEnd = 3)
pitch3_0 <- pitch.cut0(pitch, tStart = 2, tEnd = 3)
pitch4 <-   pitch.cut(pitch,  tEnd = 1)
pitch4_0 <- pitch.cut0(pitch, tEnd = 1)
pitch5 <-   pitch.cut(pitch,  tStart = -1, tEnd = 1)
pitch5_0 <- pitch.cut0(pitch, tStart = -1, tEnd = 1)
## Not run: 
##D pitch.plot(pitch)
##D pitch.plot(pitch2)
##D pitch.plot(pitch2_0)
##D pitch.plot(pitch3)
##D pitch.plot(pitch3_0)
##D pitch.plot(pitch4)
##D pitch.plot(pitch4_0)
##D pitch.plot(pitch5)
##D pitch.plot(pitch5_0)
## End(Not run)



