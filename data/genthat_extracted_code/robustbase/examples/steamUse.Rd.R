library(robustbase)


### Name: steamUse
### Title: Steam Usage Data (Excerpt)
### Aliases: steamUse
### Keywords: datasets

### ** Examples

## Not run: 
##D if(require("aprean3")) { # show how  'steamUse'  is related to 'dsa01a'
##D   stm <- dsa01a
##D   names(stm) <- c("Steam", "fattyAcid", "glycerine", "wind",
##D 		  "days", "op.days", "freeze.d",
##D 		  "temperature", "wind.2", "startups")
##D   ## prove that wind.2 is  wind^2, "traditionally" rounded to 1 digit:
##D   stopifnot(all.equal(floor(0.5 + 10*stm[,"wind"]^2)/10,
##D                       stm[,"wind.2"], tol = 1e-14))
##D   ## hence drop it
##D   steamUse <- stm[, names(stm) != "wind.2"]
##D }
## End(Not run)
data(steamUse)
str(steamUse)
## Looking at this,
cbind(M=rep_len(month.abb, 25), steamUse[,5:8, drop=FALSE])
## one will conjecture that these were 25 months, Jan--Jan in a row,
## starting in a leap year (perhaps 1960 ?).

plot(steamUse)

summary(fm1 <- lmrob(Steam ~ temperature + op.days, data=steamUse))
## diagnoses 2 outliers: month of July, maybe company-wide summer vacations
## KS2014 alone seems not robust enough:
summary(fm.14 <- lmrob(Steam ~ temperature + op.days, data=steamUse,
         setting="KS2014"))
pairs(Steam ~ temperature+op.days, steamUse)



