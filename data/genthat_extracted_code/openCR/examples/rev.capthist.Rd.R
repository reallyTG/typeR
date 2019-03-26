library(openCR)


### Name: rev.capthist
### Title: Reverse Primary Sessions
### Aliases: rev.capthist
### Keywords: manip

### ** Examples


summary(rev(ovenCH), terse = TRUE)

# These three models give the same result for gamma except for
# gamma(1982) which is confounded with p and not separately estimable:

## Not run: 
##D 
##D dipperPradel <- openCR.fit(dipperCH, type = "Pradelg", model = list(p~t, phi~t, gamma~t))
##D revdipper <- openCR.fit(rev(dipperCH), model=list(p~t, phi~t))
##D dipperJSSA <- openCR.fit(dipperCH, type='JSSAgCL', model=list(p~t, phi~t, gamma~t))
##D 
##D predict(dipperPradel)$gamma
##D predict(revdipper)$phi
##D predict(dipperJSSA)$gamma
##D 
## End(Not run)




