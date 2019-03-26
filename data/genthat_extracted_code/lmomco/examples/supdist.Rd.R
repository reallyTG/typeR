library(lmomco)


### Name: supdist
### Title: The Support of a Distribution based on the Parameters
### Aliases: supdist
### Keywords: utility (distribution) distribution (utility)

### ** Examples

lmr <- lmoms(c(33, 37, 41, 54, 78, 91, 100, 120, 124))
supdist(lmom2par(lmr, type="gov" )) # Lower = 27.41782, Upper = 133.01470
supdist(lmom2par(lmr, type="gev" )) # Lower = -Inf,     Upper = 264.4127

supdist(lmom2par(lmr, type="wak" ))               # Lower = 16.43722, Upper = NaN
supdist(lmom2par(lmr, type="wak" ), trapNaN=TRUE) # Lower = 16.43722, Upper = 152.75126
#$support  16.43722  152.75126
#$fexpons        NA  -16
#$finite       TRUE  TRUE
## Not run: 
##D para <- vec2par(c(0.69, 0.625), type="kmu") # very flat tails and narrow peak!
##D supdist(para, delexp=1   )$support # [1] 0        NaN
##D supdist(para, delexp=0.5 )$support # [1] 0.000000 3.030334
##D supdist(para, delexp=0.05)$support # [1] 0.000000 3.155655
##D # This distribution appears to have a limit at PI and the delexp=0.5
## End(Not run)



