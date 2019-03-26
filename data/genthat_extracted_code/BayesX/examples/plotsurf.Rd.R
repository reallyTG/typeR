library(BayesX)


### Name: plotsurf
### Title: Visualise Surface Estimates
### Aliases: plotsurf akimaPermit akimaPermitStatus
### Keywords: hplot

### ** Examples

res <- read.table(system.file("examples/surface_f_x1_x2_pspline.res", 
                              package="BayesX"), header=TRUE)

# call akimaPermit to allow use of akima despite its licence that restricts
# usage to non-commercial purposes
akimaPermit()
plotsurf(res)
plotsurf(res, mode=2)
plotsurf(res, mode=3)

plotsurf(res, x="x1", y="x2", z="pmed")

plotsurf(res, ticktype="simple")

plotsurf(res, main="3D-Plot", xlab="myx", ylab="myy", zlab="f(myx,myy)")



