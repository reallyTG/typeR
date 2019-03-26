library(SEERaBomb)


### Name: csd
### Title: Cancer risk vs years Since Diagnosis of other cancer
### Aliases: csd
### Keywords: IO

### ** Examples

## Not run: 
##D library(SEERaBomb)
##D pm=simSeerSet()
##D pm=mk2D(pm)
##D pm$canc
##D pm=csd(pm,brkst=c(0,5),brksy=c(1973,2000),brksa=c(0,50),trts=c("noRad","rad"))
##D pm
##D library(ggplot2)
##D theme_set(theme_gray(base_size = 16)) 
##D theme_update(legend.position = "top")
##D g=qplot(x=t,y=RR,data=subset(pm$DF,cancer1=="A"&cancer2=="B"),col=trt,geom=c("line","point"),
##D         xlab="Years Since First Cancer Diagnosis",ylab="Relative Risk")
##D g=g+facet_grid(yearG~ageG,scales="free")+geom_abline(intercept=1, slope=0) 
##D g+geom_errorbar(aes(ymin=rrL,ymax=rrU,width=.15))
## End(Not run)



