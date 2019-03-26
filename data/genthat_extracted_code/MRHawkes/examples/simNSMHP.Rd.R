library(MRHawkes)


### Name: simNSMHP
### Title: Simulate a (bivariate) non-stationary multivariate Hawkes
###   process (NSMHP)
### Aliases: simNSMHP
### Keywords: self-exciting

### ** Examples

  B <- 10; i <- 0;
  data <- replicate(B, 
                    {cat(i<<-i+1,'\n'); 
                    simNSMHP(TT = 100)
                    })



