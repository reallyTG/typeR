library(OasisR)


### Name: ResamplePlot
### Title: A function to plot the results of resampling methods
### Aliases: ResamplePlot

### ** Examples

x <- segdata@data[ ,1:2]

xtest <- ResampleTest (x, fun ='ISMorrill', simtype = 'MonteCarlo', 
                       sampleunit = 'unit', spatobj = segdata)
                       
ResamplePlot(xtest, var = 1)




