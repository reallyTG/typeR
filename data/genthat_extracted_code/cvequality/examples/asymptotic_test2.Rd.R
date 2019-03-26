library(cvequality)


### Name: asymptotic_test2
### Title: Asymptotic test for the equality of coefficients of variation
###   from k populations, using summary statistics when raw measurement
###   data are not available.
### Aliases: asymptotic_test2

### ** Examples


# Summary stats from Feltz and Miller 1996

miller <- data.frame(test = c('ELISA', 'WEHI', '`Viral inhibition`'),
                    Mean = c(6.8, 8.5, 6.0),
                    CV =   c(0.090, 0.462, 0.340),
                    N =    c(5, 5, 5))
# compute SD from mean and cv
miller$SD <- with(miller, CV * Mean)

 asymptotic_test2(k = nrow(miller), n = miller$N, s = miller$SD, x = miller$Mean)




