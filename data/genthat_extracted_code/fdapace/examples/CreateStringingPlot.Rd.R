library(fdapace)


### Name: CreateStringingPlot
### Title: Create plots for observed and stringed high dimensional data
### Aliases: CreateStringingPlot

### ** Examples

set.seed(1)
n <- 50
wiener = Wiener(n = n)[,-1]
p = ncol(wiener)
rdmorder = sample(size = p, x=1:p, replace = FALSE)
stringingfit = Stringing(X = wiener[,rdmorder], disOptns = "correlation")
diff_norev = sum(abs(rdmorder[stringingfit$StringingOrder] - 1:p))
diff_rev = sum(abs(rdmorder[stringingfit$StringingOrder] - p:1))
if(diff_rev <= diff_norev){
  stringingfit$StringingOrder = rev(stringingfit$StringingOrder)
  stringingfit$Ly = lapply(stringingfit$Ly, rev)
}
CreateStringingPlot(stringingfit, 1:20)




