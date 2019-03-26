library(EngrExpt)


### Name: ph
### Title: pH measurements in a chemical process
### Aliases: ph
### Keywords: datasets

### ** Examples

str(ph)
summary(ph)
dotplot(batch ~ ph, ph, pch = 21, jitter.y = TRUE)
ph$obs <- as.integer(gl(12, 1, len = 35))
xyplot(ph ~ obs|batch, ph, type = c("g","b"), layout = c(1,3),
       strip = FALSE, strip.left = TRUE, xlab = NULL)



