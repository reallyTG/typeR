library(rmeta)


### Name: metaplot
### Title: Meta-analysis plot (forest plot)
### Aliases: metaplot
### Keywords: hplot

### ** Examples

data(catheter)
a <- meta.MH(n.trt, n.ctrl, col.trt, col.ctrl, data=catheter,
             names=Name, subset=c(13,6,5,3,7,12,4,11,1,8,10,2))
metaplot(a$logOR, a$selogOR, nn=a$selogOR^-2, a$names,
         summn=a$logMH, sumse=a$selogMH, sumnn=a$selogMH^-2,
         logeffect=TRUE)
metaplot(a$logOR, a$selogOR, nn=a$selogOR^-2, a$names,
         summn=a$logMH, sumse=a$selogMH, sumnn=a$selogMH^-2,
         logeffect=TRUE,logticks=FALSE)
## angry fruit salad
metaplot(a$logOR, a$selogOR, nn=a$selogOR^-2, a$names,
         summn=a$logMH, sumse=a$selogMH, sumnn=a$selogMH^-2,
         logeffect=TRUE, colors=meta.colors(box="magenta",
             lines="blue", zero="red", summary="orange",
             text="forestgreen"))



