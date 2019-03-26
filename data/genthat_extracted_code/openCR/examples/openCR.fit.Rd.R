library(openCR)


### Name: openCR.fit
### Title: Fit Open Population Capture-Recapture Model
### Aliases: openCR.fit
### Keywords: model

### ** Examples


## CJS default
openCR.fit(ovenCH)

## POPAN Jolly-Seber Schwarz-Arnason, lambda parameterisation
L1 <- openCR.fit(ovenCH, type = 'JSSAl')
predict(L1)

## Not run: 
##D JSSA1 <- openCR.fit(ovenCH, type = 'JSSAf')
##D JSSA2 <- openCR.fit(ovenCH, type = 'JSSAf', model = list(phi~t))
##D JSSA3 <- openCR.fit(ovenCH, type = 'JSSAf', model = list(p~t,phi~t))
##D AIC (JSSA1, JSSA2, JSSA3)
##D predict(JSSA1)
##D 
##D RMdata <- RMarkInput (join(reduce(ovenCH, by = "all")))
##D if (require(RMark)) {
##D     MarkPath <- 'c:/Mark/'
##D     if (!all (nchar(Sys.which(c('mark.exe', 'mark64.exe', 'mark32.exe'))) < 2)) {
##D         openCHtest <- process.data(RMdata, model = 'POPAN')
##D         openCHPOPAN <- mark(data = openCHtest, model = 'POPAN',
##D             model.parameters = list(p = list(formula = ~1),
##D             pent = list(formula = ~1),
##D             Phi = list(formula = ~1)))
##D         popan.derived(openCHtest, openCHPOPAN)
##D         cleanup(ask = FALSE)
##D     } else message ("mark.exe not found")
##D } else message ("RMark not found")
##D 
## End(Not run)




