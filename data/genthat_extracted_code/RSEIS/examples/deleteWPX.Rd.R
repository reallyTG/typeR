library(RSEIS)


### Name: deleteWPX
### Title: Delete picks to WPX file
### Aliases: deleteWPX
### Keywords: misc

### ** Examples

s1 <- setWPX(name="HI", yr=2011, jd=231, hr=4, mi=3, sec = runif(5)) 
s2 <- setWPX(name="HI", yr=2011, jd=231, hr=4, mi=3, sec = runif(1)) 

s3 <- addWPX(s1, s2)

s4 <- deleteWPX(s3, ind=2:3)




