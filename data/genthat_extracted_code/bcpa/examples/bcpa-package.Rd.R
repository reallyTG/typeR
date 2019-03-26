library(bcpa)


### Name: bcpa-package
### Title: Behavioral Change Point Analysis
### Aliases: bcpa-package bcpa
### Keywords: bcpa

### ** Examples

# Running through a complete analysis here:
## loading the data
  data(Simp)
## plotting the track (using the plot.track method)
  plot(Simp)
## Obtaining the movement summary table (with turning angles and step lengths)
  Simp.VT <- GetVT(Simp)
## Applying the analysis
  Simp.ws <- WindowSweep(Simp.VT, "V*cos(Theta)", windowsize = 50, windowstep = 1, progress=TRUE)
## plotting outpots
  plot(Simp.ws, threshold=7)
  plot(Simp.ws, type="flat", clusterwidth=3)
  PathPlot(Simp, Simp.ws)
  PathPlot(Simp, Simp.ws, type="flat")
## Diagnostic of assumptions
  DiagPlot(Simp.ws)



