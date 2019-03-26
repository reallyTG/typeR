library(HH)


### Name: panel.interaction2wt
### Title: Plot all main effects and twoway interactions in a multifactor
###   design
### Aliases: panel.interaction2wt strip.interaction2wt
### Keywords: aplot design

### ** Examples

## Not run: 
##D tmp <- data.frame(y=rnorm(48),
##D                   A=factor(rep(1:2, 24)),
##D                   B=factor(rep(rep(1:3, each=2), 8)),
##D                   C=factor(rep(rep(1:4, each=6), 2)))
##D interaction2wt(y ~ A+B+C, data=tmp,
##D                key.in=list(x=-3), ## key.in is ignored by R
##D                xlim=c(.4, 4.5))
##D interaction2wt(y ~ B+C, data=tmp, key.in=list(x=-2), xlim=c(.4, 4.5))
##D position(tmp$B) <- c(1, 2.4, 3.8)
##D interaction2wt(y ~ B+C, data=tmp, key.in=list(x=-2), xlim=c(.4, 4.5))
##D interaction2wt(y ~ B+C, data=tmp, simple=TRUE,
##D                simple.scale=list(B=.18, C=.27),  box.ratio=.2,
##D                key.in=list(x=-2), xlim=c(.4, 4.5))
##D interaction2wt(y ~ C+B, data=tmp, simple=TRUE,
##D                simple.scale=list(B=.18, C=.27),  box.ratio=.2,
##D                key.in=list(x=-2), xlim=c(.4, 4.5))
##D interaction2wt(y ~ B+C, data=tmp, simple=TRUE,
##D                simple.scale=list(B=.18, C=.27),  box.ratio=.2,
##D                simple.pch=list(C=c(16,17,18,19)),
##D                key.in=list(x=-2), xlim=c(.4, 4.5))
##D interaction2wt(y ~ C+B, data=tmp, simple=TRUE,
##D                simple.scale=list(B=.18, C=.27),  box.ratio=.2,
##D                simple.pch=list(C=c(16,17,18,19)),
##D                key.in=list(x=-2), xlim=c(.4, 4.5))
##D interaction2wt(y ~ C+B, data=tmp, simple=TRUE,
##D                simple.scale=list(B=.18, C=.27),  box.ratio=.2,
##D                simple.pch=list(A=c(1:2), B=c(3:5), C=c(16,17,18,19)),
##D                key.in=list(x=-2), xlim=c(.4, 4.5))
##D interaction2wt(y ~ C+B, data=tmp, simple=TRUE,
##D                simple.scale=list(B=.18, C=.27),  box.ratio=.2,
##D                simple.pch=list(A=c(1:2)),
##D                key.in=list(x=-2), xlim=c(.4, 4.5))
##D interaction2wt(y ~ B+C, data=tmp, simple=TRUE,
##D                simple.scale=list(B=.18, C=.27),  box.ratio=.2,
##D                simple.pch=list(B=c(16,17,18)),
##D                key.in=list(x=-2), xlim=c(.4, 4.5),
##D                se=TRUE)
## End(Not run)



