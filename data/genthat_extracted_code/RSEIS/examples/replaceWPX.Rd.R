library(RSEIS)


### Name: replaceWPX
### Title: Replace picks in WPX file
### Aliases: replaceWPX
### Keywords: misc

### ** Examples

s1 <- setWPX(name="HI", yr=2011, jd=231, hr=4, mi=3, sec = runif(5)) 
s2 <- setWPX(name="HI", yr=2011, jd=231, hr=4, mi=3, sec = runif(1)) 


s4 <- replaceWPX(s1,s2, ind=4)




