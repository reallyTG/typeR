library(bcpa)


### Name: WindowSweep
### Title: Perform window sweep for BCPA
### Aliases: WindowSweep

### ** Examples

data(Simp)
plot(Simp)
Simp.VT <- GetVT(Simp)
Simp.ws <- WindowSweep(Simp.VT, "V*cos(Theta)", windowsize = 50, windowstep = 1, progress=TRUE)
plot(Simp.ws, threshold=7)
plot(Simp.ws, type="flat", clusterwidth=3)
PathPlot(Simp, Simp.ws)
PathPlot(Simp, Simp.ws, type="flat")
DiagPlot(Simp.ws)



