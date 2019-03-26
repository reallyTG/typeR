library(outbreaker2)


### Name: outbreaker
### Title: outbreaker2: main function for reconstructing disease outbreaks
### Aliases: outbreaker

### ** Examples


## get data
data(fake_outbreak)
dat <- fake_outbreak

## Not run: 
##D ## run outbreaker
##D out <- outbreaker(data = list(dna = dat$dna, dates = dat$onset, w_dens = dat$w),
##D config = list(n_iter = 2e4, sample_every = 200))
##D plot(out)
##D as.data.frame(out)
##D 
##D ## run outbreaker, no DNA sequences
##D out2 <- outbreaker(data = list(dates = dat$onset, w_dens = w),
##D config = list(n_iter = 2e4, sample_every = 200))
##D plot(out2)
##D as.data.frame(out2)
##D 
## End(Not run)



