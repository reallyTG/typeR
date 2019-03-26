library(agridat)


### Name: eden.tea.uniformity
### Title: Uniformity trial of tea
### Aliases: eden.tea.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(eden.tea.uniformity)
##D   dat <- eden.tea.uniformity
##D   
##D   # sum(dat$yield) # 140050.6 matches total yield in appendix A
##D   # mean(dat$yield) # 972.574 match page 5554
##D   
##D   m1 <- aov(yield ~ factor(entry) + factor(row) + factor(col), data=dat)
##D   summary(m1)
##D   
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           aspect=1,
##D           main="eden.tea.uniformity")
##D   
## End(Not run)



