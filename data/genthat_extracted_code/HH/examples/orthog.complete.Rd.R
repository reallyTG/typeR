library(HH)


### Name: orthog.complete
### Title: Construct an orthogonal matrix which is an arbitrary completion
###   of the column space of the input set of columns.
### Aliases: orthog.complete orthog.construct
### Keywords: algebra

### ** Examples

zapsmall(
orthog.complete(cbind("4-12"=c(-1,-1, 0, 2),
                      "1-2" =c( 1,-1, 0, 0)))
)

zapsmall(
orthog.complete(cbind("4-12"=c(-1,-1, 0, 2),
                      "1-2" =c( 1,-1, 0, 0)),
                drop.Int=FALSE)
)

zapsmall(
orthog.complete(cbind("4-12"=c(-1,-1, 0, 2),
                      "1-2" =c( 1,-1, 0, 0)),
                normalize="abs2")
)


## used in MMC plots
tmp <- data.frame(y=rnorm(12),
                  a=factor(c("u","u","u","u",
                             "v","v","v","v",
                             "w","w","w","w")))
tmp.aov <- aov(y ~ a, data=tmp)
lmat <- if.R(
  s=multicomp(tmp.aov, focus="a")$lmat,
  r={lmat.reduced <- t(glht(tmp.aov, linfct=mcp(a="Tukey"))$linfct)
     rbind(lmat.reduced, AU=-apply(lmat.reduced[-1,], 2, sum))
    })
zapsmall(lmat)

lmat.complete <- orthog.complete(lmat, abs2.rows=-1,
                                 normalize="abs2",
                                 drop.Int=FALSE)[,1:3]
zapsmall(lmat.complete)
if.R(r=zapsmall(lmat.complete[-4,]),
     s={})





