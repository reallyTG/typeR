library(car)


### Name: Ellipses
### Title: Ellipses, Data Ellipses, and Confidence Ellipses
### Aliases: ellipse dataEllipse confidenceEllipse
###   confidenceEllipse.default confidenceEllipse.lm confidenceEllipse.glm
### Keywords: hplot aplot

### ** Examples

dataEllipse(Duncan$income, Duncan$education, levels=0.1*1:9, 
    ellipse.label=0.1*1:9, lty=2, fill=TRUE, fill.alpha=0.1)
    
confidenceEllipse(lm(prestige~income+education, data=Duncan), Scheffe=TRUE)

confidenceEllipse(lm(prestige~income+education, data=Duncan), vcov.=hccm)

confidenceEllipse(lm(prestige~income+education, data=Duncan), 
	L=c("income + education", "income - education"))

wts <- rep(1, nrow(Duncan))
wts[c(6, 16)] <- 0 # delete Minister, Conductor
with(Duncan, {
	dataEllipse(income, prestige, levels=0.68)
	dataEllipse(income, prestige, levels=0.68, robust=TRUE, 
	    plot.points=FALSE, col="green3")
	dataEllipse(income, prestige, weights=wts, levels=0.68, 
	    plot.points=FALSE, col="brown")
	dataEllipse(income, prestige, weights=wts, robust=TRUE, levels=0.68, 
		plot.points=FALSE, col="blue")
	})
    
with(Prestige, dataEllipse(income, education, type, 
    id=list(n=2, labels=rownames(Prestige)), pch=15:17,
    xlim=c(0, 25000), center.pch="+",
    group.labels=c("Blue Collar", "Professional", "White Collar"),
    ylim=c(5, 20), level=.95, fill=TRUE, fill.alpha=0.1))



