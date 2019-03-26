library(Publish)


### Name: plot.ci
### Title: Plot confidence intervals
### Aliases: plot.ci

### ** Examples


data(Diabetes)
x=ci.mean(bp.2s~AgeGroups,data=Diabetes)
plot(x,title.labels="Age groups",xratio=c(0.4,0.3))
x=ci.mean(bp.2s/500~AgeGroups+gender,data=Diabetes)
plot(x,xratio=c(0.4,0.2))
plot(x,xratio=c(0.4,0.2),
     labels=split(x$labels[,"AgeGroups"],x$labels[,"gender"]),
     title.labels="Age groups")
## Not run: 
##D plot(x, leftmargin=0, rightmargin=0)
##D plotConfidence(x, leftmargin=0, rightmargin=0)
##D 
##D data(CiTable)
##D with(CiTable,plotConfidence(x=list(HazardRatio),
##D                                lower=lower,
##D                                upper=upper,
##D                                labels=CiTable[,2:6],
##D                                factor.reference.pos=c(1,10,19),
##D                                format="(u-l)",
##D                                points.col="blue",
##D                                digits=2))
##D 
##D with(CiTable,Publish::plot.ci(x=list(HazardRatio),
##D                                lower=lower,
##D                                upper=upper,
##D                                labels=CiTable[,2:6],
##D                                factor.reference.pos=c(1,10,19),
##D                                format="(u-l)",
##D                                points.col="blue",
##D                                digits=2,
##D                                leftmargin=-2,
##D                                title.labels.cex=1.1,
##D                                labels.cex=0.8,values.cex=0.8))
## End(Not run)



