library(BSDA)


### Name: tsum.test
### Title: Summarized t-test
### Aliases: tsum.test
### Keywords: htest

### ** Examples


tsum.test(mean.x=5.6, s.x=2.1, n.x=16, mu=4.9, alternative="greater")
        # Problem 6.31 on page 324 of BSDA states:  The chamber of commerce
        # of a particular city claims that the mean carbon dioxide
        # level of air polution is no greater than 4.9 ppm.  A random
        # sample of 16 readings resulted in a sample mean of 5.6 ppm,
        # and s=2.1 ppm.  One-sided one-sample t-test.  The null 
        # hypothesis is that the population mean for 'x' is 4.9.   
        # The alternative hypothesis states that it is greater than 4.9.  

x <- rnorm(12) 
tsum.test(mean(x), sd(x), n.x=12)
        # Two-sided one-sample t-test. The null hypothesis is that  
        # the population mean for 'x' is zero. The alternative 
        # hypothesis states  that it is either greater or less 
        # than zero. A confidence interval for the population mean 
        # will be computed.  Note: above returns same answer as: 
t.test(x)
   
x <- c(7.8, 6.6, 6.5, 7.4, 7.3, 7.0, 6.4, 7.1, 6.7, 7.6, 6.8) 
y <- c(4.5, 5.4, 6.1, 6.1, 5.4, 5.0, 4.1, 5.5) 
tsum.test(mean(x), s.x=sd(x), n.x=11 ,mean(y), s.y=sd(y), n.y=8, mu=2)
        # Two-sided standard two-sample t-test.  The null hypothesis  
        # is that the population mean for 'x' less that for 'y' is 2. 
        # The alternative hypothesis is that this difference is not 2. 
        # A confidence interval for the true difference will be computed.
        # Note: above returns same answer as: 
t.test(x, y)
        
tsum.test(mean(x), s.x=sd(x), n.x=11, mean(y), s.y=sd(y), n.y=8, conf.level=0.90)
        # Two-sided standard two-sample t-test.  The null hypothesis 
        # is that the population mean for 'x' less that for 'y' is zero.  
        # The alternative hypothesis is that this difference is not
        # zero.  A 90% confidence interval for the true difference will 
        # be computed.  Note: above returns same answer as:
t.test(x, y, conf.level=0.90)





