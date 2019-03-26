library(RHawkes)


### Name: simRHawkes
### Title: Simulate a renewal Hawkes (RHawkes) process
### Aliases: simRHawkes
### Keywords: renewal process self-exciting

### ** Examples

B <- 10; i <- 0;
tms <- replicate(B,
                  {cat(i<<-i+1,'\n');
                  simRHawkes(par.redist = list(shape = 3, scale = 1),
                      p.ofd = 0.5, branching.ratio = 0.5,
                      cens = 100)
                  })



