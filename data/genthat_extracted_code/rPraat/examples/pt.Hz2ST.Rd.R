library(rPraat)


### Name: pt.Hz2ST
### Title: pt.Hz2ST
### Aliases: pt.Hz2ST

### ** Examples

pt <- pt.sample()
pt2 <- pt.Hz2ST(pt, ref = 200)
## Not run: 
##D pt.plot(pt)  %>% dygraphs::dyAxis("y", label = "Frequency (Hz)")
##D pt.plot(pt2) %>% dygraphs::dyAxis("y", label = "Frequency (ST re 200 Hz)")
## End(Not run)



