library(unmarked)


### Name: unmarkedFitList-class
### Title: Class "unmarkedFitList"
### Aliases: unmarkedFitList-class modSel,unmarkedFitList-method
###   summary,unmarkedFitList-method coef,unmarkedFitList-method
###   SE,unmarkedFitList-method
### Keywords: classes

### ** Examples

showClass("unmarkedFitList")

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

coef(fl)
SE(fl)

ms <- modSel(fl, nullmod="Null")
ms





