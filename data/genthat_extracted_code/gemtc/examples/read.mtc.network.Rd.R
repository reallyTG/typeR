library(gemtc)


### Name: read.mtc.network
### Title: Read mtc.network from legacy GeMTC XML files (.gemtc)
### Aliases: read.mtc.network

### ** Examples

# Read an example GeMTC XML file
file <- system.file("extdata/luades-smoking.gemtc", package="gemtc")
network <- read.mtc.network(file)

# Summarize the network (generate some interesting network properties)
summary(network)
## $Description
## [1] "MTC dataset: Smoking cessation rates"
## 
## $`Studies per treatment`
##  A  B  C  D 
## 19  6 19  6 
## 
## $`Number of n-arm studies`
## 2-arm 3-arm 
##    22     2 



