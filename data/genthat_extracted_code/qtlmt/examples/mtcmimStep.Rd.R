library(qtlmt)


### Name: mtcmimStep
### Title: MTCMIM model selection
### Aliases: mtcmimAdd1 mtcmimDrop1 mtcmimStep mtcmimStep2

### ** Examples

data(etrait)
y<- traits[,1:5]
qtl<- vector("list",5); qtl[[1]]<- c(1,2)
dists<- dists[c(4,11),]
x<- mdat - 3/2
## Not run: 
##D o<- mtcmim(y, mpos, mdat, dists=dists, qtl=qtl, eps=NULL,
##D    win=5, range=-1, pp=2, len=1)
##D of<- mtcmimAdd1(o, y=y, mpos=mpos, mdat=mdat, pp=2, len=3)
##D os<- mtcmimStep(of, y=y, mpos=mpos, mdat=mdat, cv=25,
##D    direction="both", pp=2, len=3)
## End(Not run)



