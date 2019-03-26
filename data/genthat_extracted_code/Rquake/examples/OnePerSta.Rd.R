library(Rquake)


### Name: OnePerSta
### Title: One Phase Pick Per Station
### Aliases: OnePerSta
### Keywords: misc

### ** Examples


s1 = RSEIS::setWPX(name="HI", phase="P", yr=2011, jd=231, hr=4, mi=3, sec = runif(5)) 
s2 = RSEIS::setWPX(name="BYE", phase="P", yr=2011, jd=231, hr=4, mi=3, sec = runif(5)) 

s3 = RSEIS::catWPX(s1, s2)

s4 = OnePerSta(s3, phase = "P")






