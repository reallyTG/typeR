library(unmarked)


### Name: modSel
### Title: Model selection results from an unmarkedFitList
### Aliases: modSel modSel-methods unmarkedModSel-class
###   show,unmarkedModSel-method summary,unmarkedModSel-method
###   coef,unmarkedModSel-method SE,unmarkedModSel-method

### ** Examples

data(linetran)
(dbreaksLine <- c(0, 5, 10, 15, 20)) 
lengths <- linetran$Length * 1000

ltUMF <- with(linetran, {
	unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4), 
	siteCovs = data.frame(Length, area, habitat), dist.breaks = dbreaksLine,
	tlength = lengths, survey = "line", unitsIn = "m")
	})

fm1 <- distsamp(~ 1 ~1, ltUMF)
fm2 <- distsamp(~ area ~1, ltUMF)
fm3 <- distsamp( ~ 1 ~area, ltUMF)

fl <- fitList(Null=fm1, A.=fm2, .A=fm3)
fl

ms <- modSel(fl, nullmod="Null")
ms

coef(ms)                            # Estimates only
SE(ms)                              # Standard errors only
(toExport <- as(ms, "data.frame"))  # Everything




