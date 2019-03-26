library(corr2D)


### Name: corr2t2d
### Title: Two-trace two-dimensional (2T2D) correlation spectroscopy
### Aliases: corr2t2d

### ** Examples

    testdata <- sim2ddata()
    
    twodtest <- corr2t2d(testdata[4, ], testdata[5, ])
    
    plot_corr2d(twodtest, Im(twodtest$FT))




