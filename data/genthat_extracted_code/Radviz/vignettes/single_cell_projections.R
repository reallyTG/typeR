## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(warning=FALSE,
                      fig.retina=1,
                      fig.keep='high',
                      fig.align='center')

## ------------------------------------------------------------------------
library(Radviz)

## ------------------------------------------------------------------------
library(bodenmiller)
data(refPhenoMat)
data(refFuncMat)
data(refAnnots)
refMat <- cbind(refPhenoMat,refFuncMat)

## ------------------------------------------------------------------------
norm <- apply(refMat,2,do.L,fun=function(x) quantile(x,c(0.025,0.975)))

## ------------------------------------------------------------------------
ct.S <- make.S(dimnames(refPhenoMat)[[2]])

## ------------------------------------------------------------------------
## compute the similarity matrix
ct.sim <- cosine(norm)
## the current radviz-independent measure of projection efficiency
in.da(ct.S,ct.sim)
## the current radviz-independent measure of projection efficiency
rv.da(ct.S,ct.sim)

## ------------------------------------------------------------------------
optim.ct <- do.optim(ct.S,ct.sim,iter=100,n=1000)
ct.S <- make.S(tail(optim.ct$best,1)[[1]])

## ----echo=FALSE,results='asis'-------------------------------------------
ksink <- lapply(dimnames(refPhenoMat)[[2]],function(x) cat(' *',x,'\n'))

## ----echo=FALSE,results='asis'-------------------------------------------
ksink <- lapply(row.names(ct.S),function(x) cat(' *',x,'\n'))

## ------------------------------------------------------------------------
ct.rv <- do.radviz(norm,ct.S)

## ------------------------------------------------------------------------
plot(ct.rv)

## ------------------------------------------------------------------------
plot(ct.rv,point.shape=1)

## ------------------------------------------------------------------------
plot(ct.rv,point.shape=1,point.color=refAnnots$Cells)

## ------------------------------------------------------------------------
smoothRadviz(ct.rv)

## ------------------------------------------------------------------------
ct.rv <- do.density(ct.rv,n=100)

## ------------------------------------------------------------------------
contour(ct.rv)

## ------------------------------------------------------------------------
smoothRadviz(ct.rv)
contour(ct.rv,add=T)

## ------------------------------------------------------------------------
cur.pop <- 'igm+'
sub.rv <- subset(ct.rv,refAnnots$Cells==cur.pop)
smoothRadviz(ct.rv)
contour(sub.rv,add=T)

## ------------------------------------------------------------------------
ct.rv <- do.hex(ct.rv,n=60,
		channels=dimnames(refFuncMat)[[2]],
		ncols=7,
		use.quantile=T
)

## ------------------------------------------------------------------------
hexplot(ct.rv,mincnt=5)

## ------------------------------------------------------------------------
hexplot(ct.rv,mincnt=2,color='pS6')

## ------------------------------------------------------------------------
hexplot(ct.rv,mincnt=2,color='pAkt')

## ------------------------------------------------------------------------
hexplot(ct.rv,mincnt=2,color='pErk')

## ----results='asis'------------------------------------------------------
ksink <- lapply(levels(refAnnots$Cells),function(x) cat(' *',x,'\n'))

## ------------------------------------------------------------------------
library(colorspace)
pop.norm <- apply(refMat,2,do.L,fun=function(x) quantile(x,c(0.025,0.975)) )
pop.norm <- apply(pop.norm,2,function(x) tapply(x,refAnnots$Cells,median) )
pop.rv <- do.radviz(pop.norm,ct.S)
pop.size <- table(refAnnots$Cells)
pop.cols <- setNames(rainbow_hcl(length(levels(refAnnots$Cells))),
                     levels(refAnnots$Cells))

## ----fig.width=6,fig.height=3--------------------------------------------
par(mfrow=c(1,2))
bubbleRadviz(pop.rv,
             bubble.color=pop.cols[dimnames(pop.norm)[[1]]],
             bubble.size=log(pop.size[dimnames(pop.norm)[[1]]]),
             scale=0.2,
             decreasing=TRUE
)
plot.new()
legend("center",
       legend=names(pop.cols),
       col=pop.cols,
       cex=0.8,
       pch=16,
       bty='n')

## ------------------------------------------------------------------------
S6.cols <- setNames(colorRampPalette(blues9)(8)[cut(pop.norm[,'pS6'],
                                                    breaks=8,
                                                    labels=F,
                                                    include.lowest=TRUE)],
                    dimnames(pop.norm)[[1]])
bubbleRadviz(pop.rv,
             bubble.color=S6.cols[dimnames(pop.norm)[[1]]],
             bubble.fg='grey',
             bubble.size=log(pop.size[dimnames(pop.norm)[[1]]]),
             scale=0.2,
             decreasing=TRUE
)

