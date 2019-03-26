library(PASWR)


### Name: z.test
### Title: Z-test
### Aliases: z.test
### Keywords: htest

### ** Examples

with(data = Grocery,
z.test(x=groceries,sigma.x=30,conf.level=.97)$conf)
        # Example 8.3 from PASWR.

x <- rnorm(12)
z.test(x,sigma.x=1)
        # Two-sided one-sample z-test where the assumed value for 
        # sigma.x is one. The null hypothesis is that the population 
        # mean for 'x' is zero. The alternative hypothesis states 
        # that it is either greater or less than zero. A confidence 
        # interval for the population mean will be computed.
   
x <- c(7.8, 6.6, 6.5, 7.4, 7.3, 7., 6.4, 7.1, 6.7, 7.6, 6.8)
y <- c(4.5, 5.4, 6.1, 6.1, 5.4, 5., 4.1, 5.5)
z.test(x, sigma.x=0.5, y, sigma.y=0.5, mu=2)
        # Two-sided standard two-sample z-test where both sigma.x 
        # and sigma.y are both assumed to equal 0.5. The null hypothesis 
        # is that the population mean for 'x' less that for 'y' is 2. 
        # The alternative hypothesis is that this difference is not 2. 
        # A confidence interval for the true difference will be computed.
   
z.test(x, sigma.x=0.5, y, sigma.y=0.5, conf.level=0.90)
        # Two-sided standard two-sample z-test where both sigma.x and 
        # sigma.y are both assumed to equal 0.5. The null hypothesis 
        # is that the population mean for 'x' less that for 'y' is zero.  
        # The alternative hypothesis is that this difference is not
        # zero.  A 90% confidence interval for the true difference will 
        # be computed.
rm(x, y)        



