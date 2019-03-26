library(fastLink)


### Name: emlinkRS
### Title: emlinkRS
### Aliases: emlinkRS

### ** Examples

## Not run: 
##D ## -------------
##D ## Run on subset
##D ## -------------
##D dfA.s <- dfA[sample(1:nrow(dfA), 50),]; dfB.s <- dfB[sample(1:nrow(dfB), 50),]
##D 
##D ## Calculate gammas
##D g1 <- gammaCKpar(dfA.s$firstname, dfB.s$firstname)
##D g2 <- gammaCKpar(dfA.s$middlename, dfB.s$middlename)
##D g3 <- gammaCKpar(dfA.s$lastname, dfB.s$lastname)
##D g4 <- gammaKpar(dfA.s$birthyear, dfB.s$birthyear)
##D 
##D ## Run tableCounts
##D tc <- tableCounts(list(g1, g2, g3, g4), nobs.a = nrow(dfA.s), nobs.b = nrow(dfB.s))
##D 
##D ## Run EM
##D em <- emlinkMAR(tc, nobs.a = nrow(dfA.s), nobs.b = nrow(dfB.s))
##D 
##D ## ------------------
##D ## Apply to full data
##D ## ------------------
##D 
##D ## Calculate gammas
##D g1 <- gammaCKpar(dfA$firstname, dfB$firstname)
##D g2 <- gammaCKpar(dfA$middlename, dfB$middlename)
##D g3 <- gammaCKpar(dfA$lastname, dfB$lastname)
##D g4 <- gammaKpar(dfA$birthyear, dfB$birthyear)
##D 
##D ## Run tableCounts
##D tc <- tableCounts(list(g1, g2, g3, g4), nobs.a = nrow(dfA), nobs.b = nrow(dfB))
##D 
##D em.full <- emlinkRS(tc, em, nrow(dfA), nrow(dfB)
## End(Not run)




