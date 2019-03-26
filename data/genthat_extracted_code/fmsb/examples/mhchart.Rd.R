library(fmsb)


### Name: mhchart
### Title: Draw maternity history charts.
### Aliases: mhchart

### ** Examples

 Developing <- c(18, 21, 24, 27, 30, 33.5, 37)
 Hutterite <- c(23, 25, 27, 29, 31, 33, 35, 37, 39)
 Gainj <- c(27, 31, 35, 39)
 Japan <- c(29, 34)
 x <- list(
  Developing=Developing,
  Hutterite=Hutterite,
  Gainj=Gainj,
  Japan=Japan)
 mhchart(rev(x), COL="blue", FILL="pink", BWD=2, XLIM=c(15, 45),
  main="Maternity histories for selected populations",
  xlab="Maternal age (years)")



