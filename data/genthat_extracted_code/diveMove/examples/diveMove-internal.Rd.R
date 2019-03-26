library(diveMove)


### Name: diveMove-internal
### Title: Internal diveMove Functions
### Aliases: .depthFilter .derivStats .diveIndices .getInterval .plotTDR
###   .plotZOCfilters .plotZOCtdrs .speedStats .night .rleActivity
###   .speedNames .speedCol .zoc
### Keywords: internal

### ** Examples


data(divesTDR)

times <- getTime(divesTDR)
depths <- getDepth(divesTDR)

## No test: 
## This can take too long
## .depthFilter

d.filter <- diveMove:::.depthFilter(depth=depths, k=c(3, 5760),
                                    probs=c(0.5, 0.02), depth.bounds=c(0, 5),
                                    na.rm=TRUE)
## Set negative depths to zero
d.filter[d.filter[, 3] < 0, 3] <- 0

## Plotting

idx <- seq(95, 6000)		# try different slices
idx <- seq(nrow(d.filter))
## Look at the top 10 m only plus a few meters above
ylim <- c(-10, 5)

layout(seq(3))
plot(times[idx], -depths[idx], type="l", col="gray",
     ylab="Depth (m)", ylim=ylim)
abline(h=0, lty=2)
legend("topleft", legend="original", lty=1, col="gray")
plot(times[idx], -d.filter[idx, 1], type="l", col=2,
     ylab="Depth (m)", ylim=ylim)
abline(h=0, lty=2)
lines(times[idx], -d.filter[idx, 2])
legend("topleft", legend=colnames(d.filter)[-3],
       lty=1, col=c(2, 1))
plot(times[idx], -d.filter[idx, 3], type="l", ylim=ylim,
     ylab="Depth (m)"); abline(h=0, lty=2)
legend("topleft", legend=paste("Original -", colnames(d.filter)[2]),
       lty=1)
## End(No test)




