library(RcmdrMisc)


### Name: Dotplot
### Title: Dot Plots
### Aliases: Dotplot
### Keywords: hplot

### ** Examples

if (require(car)){
  data(Duncan)
  with(Duncan, {
    Dotplot(education)
    Dotplot(education, bin=TRUE)
    Dotplot(education, by=type)
    Dotplot(education, by=type, bin=TRUE)
  })
}



