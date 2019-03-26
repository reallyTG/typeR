library(subscore)


### Name: subscore.Wainer
### Title: Estimating true subscores using Wainer's augmentation method
### Aliases: subscore.Wainer

### ** Examples

 
       test.data<-data.prep(scored.data,c(3,15,15,20),
                            c("Algebra","Geometry","Measurement", "Math"))
        
        subscore.Wainer(test.data)
        
        subscore.Wainer(test.data)$summary
        subscore.Wainer(test.data)$subscore.augmented



