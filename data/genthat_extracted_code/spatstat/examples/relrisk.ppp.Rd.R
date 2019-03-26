library(spatstat)


### Name: relrisk.ppp
### Title: Nonparametric Estimate of Spatially-Varying Relative Risk
### Aliases: relrisk.ppp
### Keywords: spatial methods smooth

### ** Examples

   p.oak <- relrisk(urkiola, 20)
   if(interactive()) {
      plot(p.oak, main="proportion of oak")
      plot(eval.im(p.oak > 0.3), main="More than 30 percent oak")
      plot(split(lansing), main="Lansing Woods")
      p.lan <- relrisk(lansing, 0.05, se=TRUE)
      plot(p.lan$estimate, main="Lansing Woods species probability")
      plot(p.lan$SE, main="Lansing Woods standard error")
      wh <- im.apply(p.lan$estimate, which.max)
      types <- levels(marks(lansing))
      wh <- eval.im(types[wh])
      plot(wh, main="Most common species")
   }



