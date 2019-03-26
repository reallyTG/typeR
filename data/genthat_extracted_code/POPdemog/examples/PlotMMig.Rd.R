library(POPdemog)


### Name: PlotMMig
### Title: Plot Multiple Migrations
### Aliases: PlotMMig

### ** Examples

mig.cmd <- "./ms 15 100 -t 3.0 -I 6 0 7 0 0 8 0 -m 1 2 2.5 -m 2 1 2.5 -m 2 3 2.5 
-m 3 2 2.5 -m 4 5 2.5 -m 5 4 2.5 -m 5 6 2.5 -m 6 5 2.5 -em 2.0 3 4 2.5 
-em 2.0 4 3 2.5"
out<-PlotMS(input.cmd = mig.cmd, type = "ms", N4 = 10000, 
plot.out = FALSE, demo.out = TRUE, col.pop = 1:6, cex.lab = 1.5);
PlotMMig(demograph_out = out$demograph_out, mig_par = out$mig_par)



