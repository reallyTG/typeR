library(CoopGame)


### Name: shapleyValue
### Title: Compute Shapley value
### Aliases: shapleyValue

### ** Examples

library(CoopGame)
shapleyValue(v=c(0,0,0,1,2,3,7.5))

## No test: 
#Example of a non-superadditive game,
#i.e. the inheritance problem due to Ibn Ezra (1146),
#from paper by Robert Aumann from 2010 on
#'Some non-superadditive games, and their Shapley values, in the Talmud'
library(CoopGame)
Aumann2010Example<-c(120,60,40,30,120,120,120,60,60,40,120,120,120,60,120)
shapleyValue(Aumann2010Example)
#[1] 80.83333 20.83333 10.83333  7.50000
## End(No test)




