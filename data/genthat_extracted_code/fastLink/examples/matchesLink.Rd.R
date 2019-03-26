library(fastLink)


### Name: matchesLink
### Title: matchesLink
### Aliases: matchesLink

### ** Examples

## Not run: 
##D ## Calculate gammas
##D g1 <- gammaCKpar(dfA$firstname, dfB$firstname)
##D g2 <- gammaCKpar(dfA$middlename, dfB$middlename)
##D g3 <- gammaCKpar(dfA$lastname, dfB$lastname)
##D g4 <- gammaKpar(dfA$birthyear, dfB$birthyear)
##D 
##D ## Run tableCounts
##D tc <- tableCounts(list(g1, g2, g3, g4), nobs.a = nrow(dfA), nobs.b = nrow(dfB))
##D 
##D ## Run EM
##D em <- emlinkMAR(tc)
##D 
##D ## Get matches
##D ml <- matchesLink(list(g1, g2, g3, g4), nobs.a = nrow(dfA), nobs.b = nrow(dfB),
##D em = em, thresh = .95)
## End(Not run)




