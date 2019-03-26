library(bcpa)


### Name: DiagPlot
### Title: Diagnostic plot for BCPA
### Aliases: DiagPlot

### ** Examples

data(Simp)
if(!exists("Simp.VT"))
 Simp.VT <- GetVT(Simp)
if(!exists("Simp.ws"))
 Simp.ws <- WindowSweep(Simp.VT, "V*cos(Theta)", windowsize = 50, windowstep = 1, progress=TRUE)
DiagPlot(Simp.ws)
DiagPlot(Simp.ws, type="flat")
# The Simp's diagnostic plots are excellent.



