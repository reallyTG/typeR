library(MFPCA)


### Name: stratSample
### Title: Sample stratified indices according to a factor variable
### Aliases: stratSample
### Keywords: internal

### ** Examples


# create factor variable
f <- as.factor(c(1,1,1,2,4,4,4,4,6,6))
table(f)

sampleInd <- MFPCA:::stratSample(f)
table(f[sampleInd])



