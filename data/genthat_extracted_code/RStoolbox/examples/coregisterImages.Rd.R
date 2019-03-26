library(RStoolbox)


### Name: coregisterImages
### Title: Image to Image Co-Registration based on Mutual Information
### Aliases: coregisterImages

### ** Examples

library(raster)
library(ggplot2)
library(reshape2)
data(rlogo)
reference <- rlogo
## Shift reference 2 pixels to the right and 3 up
missreg <- shift(reference, x = 2, y = 3)

## Compare shift
p <- ggR(reference, sat = 1, alpha = .5) 
p + ggR(missreg, sat = 1, hue = .5, alpha = 0.5, ggLayer=TRUE) 

## Coregister images (and report statistics)
coreg <- coregisterImages(missreg, master = reference,
                         nSamples = 500, reportStats = TRUE)

## Plot mutual information per shift
ggplot(coreg$MI) + geom_raster(aes(x,y,fill=mi))

## Plot joint histograms per shift (x/y shift in facet labels)
## No test: 
 
df <- melt(coreg$jointHist)   
df$L1 <- factor(df$L1, levels = names(coreg$jointHist))
df[df$value == 0, "value"] <- NA ## don't display p = 0
ggplot(df) + geom_raster(aes(x = Var2, y = Var1,fill=value)) + facet_wrap(~L1) + 
       scale_fill_gradientn(name = "p", colours =  heat.colors(10), na.value = NA)
## End(No test)
## Compare correction
ggR(reference, sat = 1, alpha = .5) +
  ggR(coreg$coregImg, sat = 1, hue = .5, alpha = 0.5, ggLayer=TRUE) 



