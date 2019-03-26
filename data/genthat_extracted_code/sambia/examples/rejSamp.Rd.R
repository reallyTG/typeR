library(sambia)


### Name: rejSamp
### Title: Rejection Sampling is a method used in sambia's function
###   'costing' (Krautenbacher et al, 2017).
### Aliases: rejSamp

### ** Examples

library(smotefamily)
library(sambia)
data.example <- sample_generator(100,ratio = 0.80)
result <- gsub('n','0',data.example[,'result'])
result <- gsub('p','1',result)
data.example[,'result'] <- as.numeric(result)
weights <- data.example[,'result']
weights <- ifelse(weights==1,1,4)
rej.sample <- sambia:::rejSamp(data=data.example, weights = weights)



