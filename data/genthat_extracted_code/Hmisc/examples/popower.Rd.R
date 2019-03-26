library(Hmisc)


### Name: popower
### Title: Power and Sample Size for Ordinal Response
### Aliases: popower posamsize print.popower print.posamsize pomodm
### Keywords: htest category

### ** Examples

# For a study of back pain (none, mild, moderate, severe) here are the
# expected proportions (averaged over 2 treatments) that will be in
# each of the 4 categories:


p <- c(.1,.2,.4,.3)
popower(p, 1.2, 1000)   # OR=1.2, total n=1000
posamsize(p, 1.2)
popower(p, 1.2, 3148)

# Compare power to test for proportions for binary case,
# proportion of events in control group of 0.1
p <- 0.1; or <- 0.85; n <- 4000
popower(c(1 - p, p), or, n)    # 0.338
bpower(p, odds.ratio=or, n=n)  # 0.320
# Add more categories, starting with 0.1 in middle
p <- c(.8, .1, .1)
popower(p, or, n)   # 0.543
p <- c(.7, .1, .1, .1)
popower(p, or, n)   # 0.67
# Continuous scale with final level have prob. 0.1
p <- c(rep(1 / n, 0.9 * n), 0.1)
popower(p, or, n)   # 0.843

# Compute the mean and median x after shifting the probability
# distribution by an odds ratio under the proportional odds model
x <- 1 : 5
p <- c(.05, .2, .2, .3, .25)
# For comparison make up a sample that looks like this
X <- rep(1 : 5, 20 * p)
c(mean=mean(X), median=median(X))
pomodm(x, p, odds.ratio=1)  # still have to figure out the right median
pomodm(x, p, odds.ratio=0.5)



