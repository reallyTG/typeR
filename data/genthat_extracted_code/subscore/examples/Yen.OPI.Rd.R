library(subscore)


### Name: Yen.OPI
### Title: Estimating true subscores using Yen's OPI
### Aliases: Yen.OPI

### ** Examples

 
        test.data<-data.prep(scored.data,c(3,15,15,20),
                             c("Algebra","Geometry","Measurement", "Math"))
        
        Yen.OPI(test.data)
        
        Yen.OPI(test.data)$summary
        Yen.OPI(test.data)$OPI



