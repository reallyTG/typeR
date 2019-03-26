library(infoDecompuTE)


### Name: adjustMissingLevels
### Title: Adjust the Missing Levels
### Aliases: adjustMissingLevels

### ** Examples


design.df = data.frame( Blk = factor(1:16),
                      	Ani = factor(c(	1,1,2,2,
                                      	1,1,2,2,
                                      	1,1,2,2,
                                      	1,1,2,2)),
                      	Trt = factor(c(	1,2,3,4,
                                      	1,2,3,4,
                                      	1,2,3,4,
                                     		1,2,3,4)))
 
adjustMissingLevels(design.df, str.for = "Ani/Trt") 




