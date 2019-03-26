library(cvequality)


### Name: mslr_test2
### Title: # Modified signed-likelihood ratio test (SLRT) for equality of
###   CVs, using summary statistics when raw measurement data are not
###   available.
### Aliases: mslr_test2

### ** Examples


# Summary stats from Feltz and Miller 1996

miller <- data.frame(test = c('ELISA', 'WEHI', '`Viral inhibition`'),
                    Mean = c(6.8, 8.5, 6.0),
                    CV =   c(0.090, 0.462, 0.340),
                    N =    c(5, 5, 5))
# compute SD from mean and cv
miller$SD <- with(miller, CV * Mean)

 mslr_test2(nr = 1e3, n = miller$N, s = miller$SD, x = miller$Mean)





