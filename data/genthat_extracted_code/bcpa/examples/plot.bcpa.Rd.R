library(bcpa)


### Name: plot.bcpa
### Title: Plotting method for BCPA output
### Aliases: plot.bcpa

### ** Examples

if(!exists("Simp.ws"))
{
 data(Simp)
 Simp.ws <- WindowSweep(GetVT(Simp), "V*cos(Theta)", windowsize = 50, windowstep = 1, progress=TRUE)
}

plot(Simp.ws)
# this actually provides basically the exact original changepoints
plot(Simp.ws, threshold=7)
# here's a flat analysis
plot(Simp.ws, type="flat", clusterwidth=3, legend=FALSE)



