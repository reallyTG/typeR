library(Hmisc)


### Name: Ecdf
### Title: Empirical Cumulative Distribution Plot
### Aliases: Ecdf Ecdf.default Ecdf.data.frame Ecdf.formula panel.Ecdf
###   prepanel.Ecdf
### Keywords: nonparametric hplot methods distribution

### ** Examples

set.seed(1)
ch <- rnorm(1000, 200, 40)
Ecdf(ch, xlab="Serum Cholesterol")
scat1d(ch)                       # add rug plot
histSpike(ch, add=TRUE, frac=.15)   # add spike histogram
# Better: add a data density display automatically:
Ecdf(ch, datadensity='density')


label(ch) <- "Serum Cholesterol"
Ecdf(ch)
other.ch <- rnorm(500, 220, 20)
Ecdf(other.ch,add=TRUE,lty=2)


sex <- factor(sample(c('female','male'), 1000, TRUE))
Ecdf(ch, q=c(.25,.5,.75))  # show quartiles
Ecdf(ch, group=sex,
     label.curves=list(method='arrow'))


# Example showing how to draw multiple ECDFs from paired data
pre.test <- rnorm(100,50,10)
post.test <- rnorm(100,55,10)
x <- c(pre.test, post.test)
g <- c(rep('Pre',length(pre.test)),rep('Post',length(post.test)))
Ecdf(x, group=g, xlab='Test Results', label.curves=list(keys=1:2))
# keys=1:2 causes symbols to be drawn periodically on top of curves


# Draw a matrix of ECDFs for a data frame
m <- data.frame(pre.test, post.test, 
                sex=sample(c('male','female'),100,TRUE))
Ecdf(m, group=m$sex, datadensity='rug')


freqs <- sample(1:10, 1000, TRUE)
Ecdf(ch, weights=freqs)  # weighted estimates


# Trellis/Lattice examples:


region <- factor(sample(c('Europe','USA','Australia'),100,TRUE))
year <- factor(sample(2001:2002,1000,TRUE))
Ecdf(~ch | region*year, groups=sex)
Key()           # draw a key for sex at the default location
# Key(locator(1)) # user-specified positioning of key
age <- rnorm(1000, 50, 10)
Ecdf(~ch | equal.count(age), groups=sex)  # use overlapping shingles
Ecdf(~ch | sex, datadensity='hist', side=3)  # add spike histogram at top



