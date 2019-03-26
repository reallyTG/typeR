library(RcmdrMisc)


### Name: Barplot
### Title: Bar Plots
### Aliases: Barplot
### Keywords: hplot

### ** Examples

if (require(car)){
    data(Mroz)
    with(Mroz, {
      Barplot(wc)
      Barplot(wc, col="lightblue")
      Barplot(wc, by=hc)
      Barplot(wc, by=hc, scale="percent")
      Barplot(wc, by=hc, style="parallel", 
        scale="percent", legend.pos="center")
    })
}



