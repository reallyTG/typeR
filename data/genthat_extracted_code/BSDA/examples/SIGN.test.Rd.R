library(BSDA)


### Name: SIGN.test
### Title: Sign Test
### Aliases: SIGN.test

### ** Examples


x <- c(7.8, 6.6, 6.5, 7.4, 7.3, 7., 6.4, 7.1, 6.7, 7.6, 6.8)
SIGN.test(x, md = 6.5)
        # Computes two-sided sign-test for the null hypothesis 
        # that the population median for 'x' is 6.5. The alternative 
        # hypothesis is that the median is not 6.5. An interpolated 95% 
        # confidence interval for the population median will be computed.
        
reaction <- c(14.3, 13.7, 15.4, 14.7, 12.4, 13.1, 9.2, 14.2, 
              14.4, 15.8, 11.3, 15.0)
SIGN.test(reaction, md = 15, alternative = "less")
        # Data from Example 6.11 page 330 of Kitchens BSDA.  
        # Computes one-sided sign-test for the null hypothesis 
        # that the population median is 15.  The alternative 
        # hypothesis is that the median is less than 15.  
        # An interpolated upper 95% upper bound for the population 
        # median will be computed.
        




