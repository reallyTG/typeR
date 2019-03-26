library(SEERaBomb)


### Name: simSeerSet
### Title: Simulate SEER cancers and population person years
### Aliases: simSeerSet
### Keywords: IO

### ** Examples

## Not run: 
##D library(SEERaBomb)
##D n=simSeerSet()
##D n=mk2D(n,secondS="B") 
##D mybrks=c(0,0.75,0.9,1.1,1.25,2,2.5,3,3.5,4,4.75,4.9,5.1,5.25,6)
##D n=tsd(n,brks=mybrks,trts=c("rad","noRad")) 
##D D=mkDF(n)%>%filter(cancer1=="A")%>%select(t,RR,L=rrL,U=rrU,trt)
##D head(D,2)
##D library(ggplot2)
##D theme_update(legend.position = c(.8, .815),
##D              axis.text=element_text(size=rel(1.2)),
##D              axis.title=element_text(size=rel(1.3)),
##D              legend.title=element_text(size=rel(1.2)),
##D              legend.text=element_text(size=rel(1.2)))
##D g=qplot(x=t,y=RR,col=trt,data=D,geom=c("line","point"),
##D         xlab="Years Since First Cancer Diagnosis",ylab="Relative Risk")
##D g+geom_abline(intercept=1, slope=0)+geom_errorbar(aes(ymin=L,ymax=U,width=.05))
## End(Not run)



