library(hexbin)


### Name: hexplom
### Title: Hexbin Plot Matrices
### Aliases: hexplom hexplom.formula hexplom.data.frame hexplom.matrix
###   panel.hexplom
### Keywords: hplot

### ** Examples


## Simple hexplom
data(NHANES)
hexplom(~NHANES[,7:14], xbins=15)

## With colors and conditioning
hexplom(~NHANES[,9:13] | Sex, data = NHANES,
        xbins = 15, colramp = magent)

## With custom panel function
hexplom(NHANES[,9:13], xbins = 20,colramp = BTY, 
        upper.panel = panel.hexboxplot)

  



