library(subscore)


### Name: subscore.sx
### Title: Computing subscores using Haberman's method based on both
###   observed total scores and observed subscores.
### Aliases: subscore.sx

### ** Examples

       test.data<-data.prep(scored.data,c(3,15,15,20),
                            c("Algebra","Geometry","Measurement", "Math"))
       
       subscore.sx(test.data) 
       subscore.s(test.data)$Correlation
       subscore.s(test.data)$Disattenuated.correlation
       subscore.sx(test.data)$summary
       subscore.sx(test.data)$PRMSE
       subscore.sx(test.data)$subscore.sx



