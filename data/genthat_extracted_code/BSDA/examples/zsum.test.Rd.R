library(BSDA)


### Name: zsum.test
### Title: Summarized z-test
### Aliases: zsum.test
### Keywords: htest

### ** Examples


zsum.test(mean.x=56/30,sigma.x=2, n.x=30, alternative="greater", mu=1.8)
        # Example 9.7 part a. from PASWR.
x <- rnorm(12)
zsum.test(mean(x),sigma.x=1,n.x=12)
        # Two-sided one-sample z-test where the assumed value for
        # sigma.x is one. The null hypothesis is that the population
        # mean for 'x' is zero. The alternative hypothesis states
        # that it is either greater or less than zero. A confidence
        # interval for the population mean will be computed.
        # Note: returns same answer as:
z.test(x,sigma.x=1)
        #
x <- c(7.8, 6.6, 6.5, 7.4, 7.3, 7.0, 6.4, 7.1, 6.7, 7.6, 6.8)
y <- c(4.5, 5.4, 6.1, 6.1, 5.4, 5.0, 4.1, 5.5)
zsum.test(mean(x), sigma.x=0.5, n.x=11 ,mean(y), sigma.y=0.5, n.y=8, mu=2)
        # Two-sided standard two-sample z-test where both sigma.x
        # and sigma.y are both assumed to equal 0.5. The null hypothesis
        # is that the population mean for 'x' less that for 'y' is 2.
        # The alternative hypothesis is that this difference is not 2.
        # A confidence interval for the true difference will be computed.
        # Note: returns same answer as:
z.test(x, sigma.x=0.5, y, sigma.y=0.5)
        #
zsum.test(mean(x), sigma.x=0.5, n.x=11, mean(y), sigma.y=0.5, n.y=8,
conf.level=0.90)
        # Two-sided standard two-sample z-test where both sigma.x and
        # sigma.y are both assumed to equal 0.5. The null hypothesis
        # is that the population mean for 'x' less that for 'y' is zero.
        # The alternative hypothesis is that this difference is not
        # zero.  A 90% confidence interval for the true difference will
        # be computed.  Note: returns same answer as:
z.test(x, sigma.x=0.5, y, sigma.y=0.5, conf.level=0.90)
rm(x, y)




