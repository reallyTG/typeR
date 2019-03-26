library(bcpa)


### Name: PathPlot
### Title: Path plot of BCPA output
### Aliases: PathPlot

### ** Examples

if(!exists("Simp.ws"))
{
 data(Simp)
 Simp.ws <- WindowSweep(GetVT(Simp), "V*cos(Theta)", windowsize = 50, windowstep = 1, progress=TRUE)
}

PathPlot(Simp, Simp.ws, plotlegend=TRUE, n.legend=3)
PathPlot(Simp, Simp.ws, type="flat", clusterwidth=3, plotlegend=TRUE)



