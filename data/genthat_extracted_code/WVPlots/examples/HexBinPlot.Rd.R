library(WVPlots)


### Name: HexBinPlot
### Title: Build a hex bin plot
### Aliases: HexBinPlot

### ** Examples


if(requireNamespace("hexbin", quietly = TRUE)) {
   set.seed(634267)
   dframe = data.frame(x = rnorm(1000), y = rnorm(1000))
   print(HexBinPlot(dframe, "x", "y", "Example hexbin"))

   diamonds = ggplot2::diamonds
   print(HexBinPlot(diamonds, "carat", "price", "Diamonds example"))
}




