library(POD)


### Name: plotPOD
### Title: Generate Plot to Analyze Single Lab PCR Outcomes
### Aliases: plotPOD

### ** Examples

x <- cbind(
 X=c(0.1,1,2,5,10,20),
 S=c( 0,5,6,6,6,6 ),
 N=c( 6,6,6,6,6,6 )
)
obj <- analyzeSingleLab(x=x)
plotPOD(obj)



