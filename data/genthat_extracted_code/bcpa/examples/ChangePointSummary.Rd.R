library(bcpa)


### Name: ChangePointSummary
### Title: Obtain summary of BCPA analysis
### Aliases: ChangePointSummary

### ** Examples

if(!exists("Simp.VT")){
 data(Simp)
 Simp.VT <- GetVT(Simp)}
if(!exists("Simp.ws"))
 Simp.ws <- WindowSweep(Simp.VT, "V*cos(Theta)", windowsize = 50, windowstep = 1, progress=TRUE)
# too many change points:
ChangePointSummary(Simp.ws)
# about the right number of change points:
ChangePointSummary(Simp.ws, clusterwidth=3)



