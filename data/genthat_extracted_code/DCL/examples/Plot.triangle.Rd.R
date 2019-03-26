library(DCL)


### Name: Plot.triangle
### Title: Plotting an incremental run-off triangle
### Aliases: Plot.triangle
### Keywords: Graphics

### ** Examples

## Plotting a counts triangle (number of reported claims)
data(NtriangleDCL)
Plot.triangle(NtriangleDCL, Histogram=TRUE,tit=expression(paste('Counts: ',N[ij])))
# Classical CL predictions
clm.N<-clm(NtriangleDCL)
Nhat<-clm.N$triangle.hat
# Compare the original histogram with the CL projections
Plot.triangle(Nhat, Histogram=TRUE,tit='CL Predictions')

## Plotting a paid triangle (number of reported claims)
data(XtriangleDCL)
Plot.triangle(XtriangleDCL)



