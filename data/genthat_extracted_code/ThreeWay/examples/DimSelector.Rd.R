library(ThreeWay)


### Name: DimSelector
### Title: Convex Hull procedure
### Aliases: DimSelector
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# Analysis on T3 with different numbers of components (from 1 to 4 for the A-mode,
# from 1 to 3 for the B-mode, from 1 to 5 for the C-mode)
FitT3 <- T3runsApproxFit(Bus,7,5,37,4,4,4)
T3opt <- DimSelector(FitT3,7,5,37,2)



