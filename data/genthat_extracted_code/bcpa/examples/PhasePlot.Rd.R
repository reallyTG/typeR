library(bcpa)


### Name: PhasePlot
### Title: Phase plot of BCPA output
### Aliases: PhasePlot

### ** Examples

if(!exists("Simp.ws"))
{
 data(Simp)
 Simp.ws <- WindowSweep(GetVT(Simp), "V*cos(Theta)", windowsize = 50, windowstep = 1, progress=TRUE)
}

PhasePlot(Simp.ws)



