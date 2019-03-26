library(Modelcharts)


### Name: LIFT_CHART
### Title: Functions Lift Chart
### Aliases: LIFT_CHART

### ** Examples

## Not run: 
##D # Run it and see for yourself
## End(Not run)
data.tmp<-read.csv(system.file("ext", "testdata.csv", package="Modelcharts"))
LIFT_CHART(data.tmp,data.tmp$Probability,seq(0.95,0,-0.05),data.tmp$Outcome,"Y")



