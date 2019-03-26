library(rPraat)


### Name: snd.cut
### Title: snd.cut
### Aliases: snd.cut

### ** Examples

snd <- snd.sample()
snd2 <-   snd.cut(snd,  Start = 0.3)
snd2_0 <- snd.cut0(snd, Start = 0.3)
snd3 <-   snd.cut(snd,  Start = 0.2, End = 0.3)
snd3_0 <- snd.cut0(snd, Start = 0.2, End = 0.3)
snd4 <-   snd.cut(snd,  End = 0.1)
snd4_0 <- snd.cut0(snd, End = 0.1)
snd5 <-   snd.cut(snd,  Start = -0.1, End = 0.1)
snd5_0 <- snd.cut0(snd, Start = -0.1, End = 0.1)
snd6 <-   snd.cut(snd,  End = 1000, units = "samples")
snd6_0 <- snd.cut0(snd, End = 1000, units = "samples")
## Not run: 
##D snd.plot(snd)
##D snd.plot(snd2)
##D snd.plot(snd2_0)
##D snd.plot(snd3)
##D snd.plot(snd3_0)
##D snd.plot(snd4)
##D snd.plot(snd4_0)
##D snd.plot(snd5)
##D snd.plot(snd5_0)
##D snd.plot(snd6)
##D snd.plot(snd6_0)
## End(Not run)



