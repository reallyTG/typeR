library(MRHawkes)


### Name: simMRHawkes
### Title: Simulate an (bivariate) renewal Hawkes (MRHawkes) process
### Aliases: simMRHawkes
### Keywords: renewal process self-exciting

### ** Examples

  B <- 10; i <- 0;
  data <- replicate(B, 
                    {cat(i<<-i+1,'\n'); 
                    simMRHawkes(re.dist1 = rweibull, 
                                par.redist1 = list(shape = 3, scale = 1.2),
                                re.dist2 = rweibull, 
                                par.redist2 = list(shape = 1 / 3, scale = 0.2),
                                p.h1 = 1, p.h2 = 1,
                                eta11 = 0.3, eta12 = 0.1, 
                                eta21 = 0.1, eta22 = 0.3,
                                cens = 100)
                    })



