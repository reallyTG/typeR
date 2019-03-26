library(brainwaver)


### Name: wave.trans
### Title: Computation of the wavelet transform
### Aliases: wave.trans
### Keywords: ts

### ** Examples


data(brain) # the result brain is a matrix
brain<-as.matrix(brain)

# WARNING : To process only the first five regions
brain<-brain[,1:5]

PreCG.R<-brain[,1]
# LA(8)
PreCG.R.la8 <- wave.trans(PreCG.R, wf="la8")
names(PreCG.R.la8) <- c("w1", "w2", "w3", "w4", "v4")
## plot partial MODWT for PreCG.R data
par(mfcol=c(6,1), pty="m", mar=c(5-2,4,4-2,2))
plot.ts(PreCG.R, axes=FALSE, ylab="", main="(a)")
for(i in 1:5)
  plot.ts(PreCG.R.la8[[i]], axes=FALSE, ylab=names(PreCG.R.la8)[i])
axis(side=1, at=seq(0,518,by=50),
  labels=c(0,"",100,"",200,"",300,"",400,"",500))




