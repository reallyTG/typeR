library(corr2D)


### Name: plot_corr2d
### Title: Plot two-dimensional correlation spectra.
### Aliases: plot_corr2d

### ** Examples

    data(FuranMale, package = "corr2D")
    twod <- corr2d(FuranMale, Ref1 = FuranMale[1, ], corenumber = 1)
    
    plot_corr2d(twod, xlab = expression(paste("relative Wavenumber" / cm^-1)),
                      ylab = expression(paste("relative Wavenumber" / cm^-1)))
                      
    plot_corr2d(twod, at.xaxs = c(1560, 1585, 1610),
                label.xaxs = c(1560, 1585, 1610),
                col = 2, lwd = 3, col.axis = 3, col.lab = 4, Legend = FALSE,
                cex.lab = 3, xlab = "Large x label", ylab = "Large y label",
                line.xlab = 5, line.ylab = 5)




