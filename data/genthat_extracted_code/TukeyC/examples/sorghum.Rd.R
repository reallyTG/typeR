library(TukeyC)


### Name: sorghum
### Title: Completely Randomized Design (CRD)
### Aliases: sorghum
### Keywords: datasets

### ** Examples

  library(TukeyC)

  data(sorghum) 

  av <- aov(y ~ r/bl + x,
            data=sorghum$dfm)

  tk <- TukeyC(av,
               which='x',
               sig.level=0.05) 

  summary(tk)

  plot(tk)



