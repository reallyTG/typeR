library(RSEIS)


### Name: repairWPX
### Title: Repair WPX
### Aliases: repairWPX
### Keywords: misc

### ** Examples


s1 <- setWPX(name="HI", yr=2011, jd=231, hr=4, mi=3, sec = runif(5)) 

s1$col <- NULL

s2 <- repairWPX(s1)







