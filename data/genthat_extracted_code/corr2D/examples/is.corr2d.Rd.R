library(corr2D)


### Name: is.corr2d
### Title: Check for object class "corr2d"
### Aliases: is.corr2d

### ** Examples

    data(FuranMale, package = "corr2D")
    twod <- corr2d(FuranMale, Ref1 = FuranMale[1, ], corenumber = 1)
    
    # TRUE
    is.corr2d(twod) 
    # FALSE
    is.corr2d(2) 




