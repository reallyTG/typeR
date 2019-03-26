library(ftsa)


### Name: dynamic_FLR
### Title: Dynamic updates via functional linear regression
### Aliases: dynamic_FLR
### Keywords: models

### ** Examples

dynamic_FLR_point = dynamic_FLR(dat = ElNino$y[,1:56], newdata = ElNino$y[1:4,57], 
	holdoutdata = ElNino$y[5:12,57], pointfore = TRUE)

dynamic_FLR_interval = dynamic_FLR(dat = ElNino$y[,1:56], newdata = ElNino$y[1:4,57], 
	holdoutdata = ElNino$y[5:12,57], pointfore = FALSE)



