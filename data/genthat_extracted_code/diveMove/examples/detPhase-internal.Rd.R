library(diveMove)


### Name: detPhase-internal
### Title: Detect phases of activity from depth readings
### Aliases: detPhase-internal .detPhase
### Keywords: internal

### ** Examples


data(divesTDR)
depths <- getDepth(divesTDR)
times <- getTime(divesTDR)

detp <- diveMove:::.detPhase(times, depths, dry.thr=70, wet.thr=3610,
                             interval=getDtime(divesTDR))
## Plot detected phases
plotTDR(times, depths, interact=FALSE)
rect(xleft=detp$begin, xright=detp$end, ybottom=0, ytop=-4,
     col=seq_along(detp$begin))




