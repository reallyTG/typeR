library(colordistance)


### Name: plotHist
### Title: Color histogram of binned image
### Aliases: plotHist

### ** Examples

color_df <- as.data.frame(matrix(rep(seq(0, 1, length.out=3), 3), nrow=3,
ncol=3))

color_df$Pct <- c(0.2, 0.5, 0.3)

colordistance::plotHist(color_df, main="Example plot")



