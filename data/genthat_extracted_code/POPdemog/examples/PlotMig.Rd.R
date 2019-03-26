library(POPdemog)


### Name: PlotMig
### Title: Plot migration event(s) at a particular time
### Aliases: PlotMig

### ** Examples

test.mig.cmd <- "./ms 15 100 -t 3.0 -I 6 0 7 0 0 8 0 -m 1 2 2.5 -m 2 1 2.5 
-m 2 3 2.5 -m 3 2 2.5 -m 4 5 2.5 -m 5 4 2.5 -m 5 6 2.5 -m 6 5 2.5 
-em 2.0 3 4 2.5 -em 2.0 4 3 2.5"
out <- PlotMS(input.cmd = test.mig.cmd, type = "ms", 
N4 = 10000, plot.out = FALSE, demo.out = TRUE);
#check all migration events
events <- out$mig_par$events
print(events)
#check the time for those migration events
timeofevents <- out$mig_par$time[events]
print(timeofevents)
#plot event by event
par(mfrow = c(1, 2))
PlotMig(event = 1, demograph_out = out$demograph_out, mig_par = out$mig_par)
title("Event-1");
PlotMig(event = 2, demograph_out = out$demograph_out, mig_par = out$mig_par, 
col.pop = 1:6, xlim = c(-5,4))
title("Event-2", cex.main = 3);
legend("topleft", col = 1:6, pch = 20, bty = "n", cex = 2,
legend = c("pop-1", "pop-2", "pop-3", "pop-4", "pop-5", "pop-6"))



