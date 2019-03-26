library(sambia)


### Name: ipOversampling
### Title: Plain replication of each observation by inverse-probability
###   weights
### Aliases: ipOversampling

### ** Examples

library(smotefamily)
library(sambia)
data.example <- sample_generator(100,ratio = 0.80)
result <- gsub('n','0',data.example[,'result'])
result <- gsub('p','1',result)
data.example[,'result'] <- as.numeric(result)
weights <- data.example[,'result']
weights <- ifelse(weights==1,1,4)
sample <- sambia::ipOversampling(data.example,weights)



