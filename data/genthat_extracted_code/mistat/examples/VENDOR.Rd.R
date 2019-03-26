library(mistat)


### Name: VENDOR
### Title: Number of cycles required until latch failure
### Aliases: VENDOR
### Keywords: datasets

### ** Examples

data(VENDOR)

VENDOR <- stack(VENDOR)               
                                      
VENDOR$ind <- as.factor(VENDOR$ind)   
                                      
VENDOR$values <- sqrt(VENDOR$values)  
                                              
confint(lm(values ~ -1 + ind,         
           data=VENDOR))



