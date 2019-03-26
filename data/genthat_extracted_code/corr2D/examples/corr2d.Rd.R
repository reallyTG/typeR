library(corr2D)


### Name: corr2d
### Title: Two-dimensional correlation analysis.
### Aliases: corr2d

### ** Examples

    data(FuranMale, package = "corr2D")
    twod <- corr2d(FuranMale, Ref1 = FuranMale[1, ], corenumber = 1)
    
    plot_corr2d(twod, xlab = expression(paste("relative Wavenumber" / cm^-1)),
                      ylab = expression(paste("relative Wavenumber" / cm^-1)))




