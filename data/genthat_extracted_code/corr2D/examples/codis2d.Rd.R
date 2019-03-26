library(corr2D)


### Name: codis2d
### Title: Two-dimensional codistribution spectroscopy.
### Aliases: codis2d

### ** Examples

    testdata <- sim2ddata(C = NULL, Camp = NULL)
    codis <- codis2d(testdata, corenumber = 1)
    
    plot_corr2d(codis, Im(codis$FT),
                xlab = expression(paste("Wavenumber" / cm^-1)),
                ylab = expression(paste("Wavenumber" / cm^-1)))




