library(fdapace)


### Name: Stringing
### Title: Stringing for High-Dimensional data
### Aliases: Stringing

### ** Examples

set.seed(1)
n <- 50
wiener = Wiener(n = n)[,-1]
p = ncol(wiener)
rdmorder = sample(size = p, x=1:p, replace = FALSE)
stringingfit = Stringing(X = wiener[,rdmorder], disOptns = "correlation")
diff_norev = sum(abs(rdmorder[stringingfit$StringingOrder] - 1:p))
diff_rev = sum(abs(rdmorder[stringingfit$StringedOrder] - p:1))
if(diff_rev <= diff_norev){
  stringingfit$StringingOrder = rev(stringingfit$StringingOrder)
  stringingfit$Ly = lapply(stringingfit$Ly, rev)
}
plot(1:p, rdmorder[stringingfit$StringingOrder], pch=18); abline(a=0,b=1)




