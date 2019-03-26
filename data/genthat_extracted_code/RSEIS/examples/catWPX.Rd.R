library(RSEIS)


### Name: catWPX
### Title: Concatenate two WPX lists
### Aliases: catWPX
### Keywords: misc

### ** Examples


s1  <-  setWPX(name="HI", yr=2011, jd=231, hr=4, mi=3, sec = runif(5)) 

s2  <-  setWPX(name="BYE", yr=2011, jd=231, hr=4, mi=3, sec = runif(5)) 

s3  <-  catWPX(s1, s2)




