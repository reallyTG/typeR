library(subscore)


### Name: subscore.x
### Title: Computing subscores using Haberman's method based on observed
###   total scores.
### Aliases: subscore.x

### ** Examples

       test.data<-data.prep(scored.data,c(3,15,15,20), 
                            c("Algebra","Geometry","Measurement", "Math"))
       
       subscore.x(test.data) 
       
       subscore.x(test.data)$summary
       subscore.x(test.data)$PRMSE
       subscore.x(test.data)$Correlation
       subscore.x(test.data)$Disattenuated.correlation
       subscore.x(test.data)$subscore.x



