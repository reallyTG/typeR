library(NetworkToolbox)


### Name: reg
### Title: Regression Matrix
### Aliases: reg

### ** Examples

#binarize responses
psyb <- ifelse(neoOpen>=4, 1, 0)

#perform logistic regression
mat <- reg(psyb)




