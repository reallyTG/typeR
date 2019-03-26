library(emuR)


### Name: plot.trackdata
### Title: Produces time-series plots from trackdata
### Aliases: plot.trackdata
### Keywords: dplot

### ** Examples



# a single segment of trackdata (F1) plotted as a function of time.
plot(vowlax.fdat[1,1])

# as above, but limits are set for the time axis.
plot(vowlax.fdat[1,1], xlim=c(880, 920))

# the the start-time of the x-axis is set to 0 ms, plot F1 and F3, lineplot
plot(vowlax.fdat[1,c(1,3)],  timestart=0, type="l")


# plot F1-F4, same colour, same plotting symbol, between 900 
# and 920 ms, type is line and points plot, different linetype per track, no box
plot(vowlax.fdat[1,], col="blue", pch=20, xlim=c(900, 920), type="b", lty=TRUE, bty="n")


# F1 and F2 of six vowels with labels, separate windows
par(mfrow=c(2,3))
plot(vowlax.fdat[1:6,1:2], contig=FALSE, labels=vowlax.l[1:6], ylab="F1 and F2", 
xlab="Time (ms)", type="b", ylim=c(300, 2400))

# As above, timestart set to zero, colour set to blue, different plotting
# symbols for the two tracks
plot(vowlax.fdat[1:6,1:2], contig=FALSE, labels=vowlax.l[1:6], ylab="F1 and F2", 
xlab="Time (ms)", type="b", col="blue", pch=c(1,2),  ylim=c(300, 2400), timestart=0)

# RMS energy for the utterance 'just relax said Coutts'
 plot(coutts.rms, type="l")
# as above a different colour
 plot(coutts.rms, type="l", col="pink")
# as above, linetype 2, double line thickness, no box, times reset to 0 ms
 plot(coutts.rms, type="l", col="pink", lty=2, lwd=2, bty="n", timestart=0)
# as above but plotted as non-contiguous segments, i.e one segment per panel
 par(mfrow=c(2,3))
 plot(coutts.rms, type="l", col="pink", lty=2, lwd=2, bty="n", timestart=0, contig=FALSE)
# plot with labels
 labels = label(coutts)
par(mfrow=c(1,1))
 plot(coutts.rms, labels=labels, type="l", bty="n")
# as above, double line-thickness, green, line type 3, no box, 
# time start 0 ms with x and y axis labels
 plot(coutts.rms, labels=labels, type="l", lwd=2, 
      col="green", lty=3,  bty="n", timestart=0, xlab="Time (ms)", ylab="Amplitude")
# as above with a different plotting symbol for the points
par(mfrow=c(2,3))
 plot(coutts.rms, labels=labels, type="b", lwd=2, col="green", 
      timestart=0, bty="n", contig=FALSE, pch=20)
 





