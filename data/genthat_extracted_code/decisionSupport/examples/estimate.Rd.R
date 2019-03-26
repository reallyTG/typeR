library(decisionSupport)


### Name: estimate
### Title: Create a multivariate estimate object.
### Aliases: estimate as.estimate

### ** Examples

# Create a minimum estimate (only mandatory marginal information supplied):
estimateMin<-estimate(c("posnorm", "lnorm"),
                      c(        4,       4),
                      c(       50,      10))
print(estimateMin) 

# Create an estimate with optional columns (only marginal information supplied):
estimateMarg<-estimate(           c("posnorm", "lnorm"),
                                  c(        4,       4),
                                  c(       50,      10),
                         variable=c("revenue", "costs"),
                         median = c(   "mean",      NA),
                         method = c(    "fit",      ""))
print(estimateMarg)
print(corMat(estimateMarg))

# Create a minimum estimate from text (only mandatory marginal information supplied):
estimateTextMin<-"distribution, lower, upper
                  posnorm,      100,   1000
                  posnorm,      50,    2000
                  posnorm,      50,    2000
                  posnorm,      100,   1000"
estimateMin<-as.estimate(read.csv(header=TRUE, text=estimateTextMin, 
                          strip.white=TRUE, stringsAsFactors=FALSE))
print(estimateMin) 

# Create an estimate from text (only marginal information supplied):
estimateText<-"variable,  distribution, lower, upper, median, method
               revenue1,  posnorm,      100,   1000,  NA,        
               revenue2,  posnorm,      50,    2000,    ,     fit
               costs1,    posnorm,      50,    2000,  70,     calculate
               costs2,    posnorm,      100,   1000,  mean,             "
estimateMarg<-as.estimate(read.csv(header=TRUE, text=estimateText, 
                          strip.white=TRUE, stringsAsFactors=FALSE))
print(estimateMarg)
print(corMat(estimateMarg))

# Create an estimate from text (with correlated components): 
estimateTextMarg<-"variable,  distribution, lower, upper
                   revenue1,  posnorm,      100,   1000
                   revenue2,  posnorm,      50,    2000
                   costs1,    posnorm,      50,    2000
                   costs2,    posnorm,      100,   1000"
estimateTextCor<-",         revenue1, costs2
                  revenue1,        1,   -0.3
                  costs2,       -0.3,      1"
estimateCor<-as.estimate(read.csv(header=TRUE, text=estimateTextMarg, 
                          strip.white=TRUE, stringsAsFactors=FALSE),
                          correlation_matrix=data.matrix(read.csv(text=estimateTextCor, 
                                                                  row.names=1,
                                                                  strip.white=TRUE)))
print(estimateCor)
print(corMat(estimateCor))



