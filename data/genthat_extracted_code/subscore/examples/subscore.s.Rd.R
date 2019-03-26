library(subscore)


### Name: subscore.s
### Title: Computing subscores using Haberman's method based on observed
###   subscores.
### Aliases: subscore.s

### ** Examples

# Transfering scored response data to the requried list format
test.data<-data.prep(scored.data,c(3,15,15,20),
                     c("Algebra","Geometry","Measurement", "Math"))
  
#Estimate true subscores using Hamerman's method based on observed subscores     
subscore.s(test.data) 
       
subscore.s(test.data)$summary
subscore.s(test.data)$Correlation
subscore.s(test.data)$Disattenuated.correlation
subscore.s(test.data)$PRMSE
subscore.s(test.data)$subscore.s



