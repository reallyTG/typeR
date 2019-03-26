library(agridat)


### Name: montgomery.wheat.uniformity
### Title: Uniformity trial of wheat, 2 years on the same land
### Aliases: montgomery.wheat.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(montgomery.wheat.uniformity)
##D   dat <- montgomery.wheat.uniformity
##D   dat09 <- subset(dat, year==1909)
##D   dat11 <- subset(dat, year==1911)
##D 
##D   # Match the figures of Montgomery 1912 Fig 3, p. 178
##D   require(desplot)
##D   desplot(yield ~ col*row, dat09,
##D           aspect=1, # true aspect
##D           main="montgomery.wheat.uniformity - 1909 yield")
##D   desplot(yield ~ col*row, subset(dat, year==1911),
##D           aspect=1, # true aspect
##D           main="montgomery.wheat.uniformity - 1911 yield")
##D 
##D   # Surface & Pearl adjust 1909 yield for fertility effects.
##D   # They calculate smoothed yield as (row sum)*(column sum)/(total)
##D   # and subtract this from the overall mean to get 'deviation'.
##D   # We can do something similar with a linear model with rows and columns
##D   # as factors, then predict yield to get the smooth trend.
##D   # Corrected yield = observed - deviation = observed - (smooth-mean)
##D   
##D   m1 <- lm(yield ~ factor(col) + factor(row), data=dat09)
##D   dev1 <- predict(m1) - mean(dat09$yield)
##D   # Corrected.  Similar (but not exact) to Surface, fig 2.
##D   dat09$correct <- round(dat09$yield - dev1,0)
##D 
##D   require(desplot)
##D   desplot(yield ~ col*row, dat09,
##D           shorten="none", text=yield,
##D           main="montgomery.wheat.uniformity 1909 observed")
##D   desplot(correct ~ col*row, dat09, text=correct,
##D           cex=0.8, shorten="none",
##D           main="montgomery.wheat.uniformity 1909 corrected")
##D   # Corrected yields are slightly shrunk toward overall mean
##D   plot(correct~yield,dat09, xlim=c(350,1000), ylim=c(350,1000))
##D   abline(0,1)
##D   
## End(Not run)



