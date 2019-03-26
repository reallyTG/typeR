library(subscore)


### Name: subscore.corr
### Title: Computing correlation indices for subscores and the total
###   score..
### Aliases: subscore.corr

### ** Examples

# Transfering scored response data to the requried list format
test.data<-data.prep(scored.data,c(3,15,15,20),
                     c("Algebra","Geometry","Measurement", "Math"))
  
#Estimate true subscores using Hamerman's method based on observed subscores     
subscore.corr(test.data) 
       
subscore.s(test.data)$summary
subscore.s(test.data)$correlation



