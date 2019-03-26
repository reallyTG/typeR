library(lsr)


### Name: longToWide
### Title: Reshape from long to wide
### Aliases: longToWide

### ** Examples

long <- data.frame( id = c(1,2,3,1,2,3,1,2,3), 
                    time = c("t1","t1","t1","t2","t2","t2","t3","t3","t3"), 
                    accuracy = c(.50,.03,.72,.94,.63,.49,.78,.71,.16) )

longToWide( long, accuracy~time)




