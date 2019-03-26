library(VGAMdata)


### Name: crime.us
### Title: Estimated Crime in 2009 in USA
### Aliases: crime.us
### Keywords: datasets

### ** Examples

## Not run: 
##D   # Louisiana is the one outlier
##D plot(MurderRate ~ stateNumber, crime.us,
##D      axes = FALSE, type = "h", col = 1:6,
##D      main = "USA murder rates in 2009 (per 100,000 population)")
##D axis(1, with(crime.us, abbrev), at = with(crime.us, stateNumber),
##D      col = 1:6, col.tick = 1:6, cex.lab = 0.5)
##D axis(2) 
## End(Not run)
tail(crime.us[ sort.list(with(crime.us, MurderRate)), ])



