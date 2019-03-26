library(OasisR)


### Name: ResampleTest
### Title: A function to test segregation indices by resampling
### Aliases: ResampleTest

### ** Examples

x <- segdata@data[ ,1:2]

xtest <- ResampleTest (x, fun ='ISMorrill', simtype = 'MonteCarlo', 
                       sampleunit = 'ind', spatobj = segdata)
xtest$Summary

xtest <- ResampleTest (x, fun ='ISMorrill', simtype = 'Boot', 
                       sampleunit = 'unit', spatobj = segdata)
xtest$Summary

xtest <- ResampleTest (GreHSize@data[,3:5], fun='ISDuncan', simtype = 'Jack', 
                       sampleunit = 'unit',  spatobj = GreHSize, 
                       outl = TRUE, outmeth = 'sd', sdtimes = 3)
xtest$Summary
xtest$OutliersVal




