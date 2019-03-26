library(simsalapar)


### Name: mayplot
### Title: Matrix-like Plot for Arrays up to Rank 5
### Aliases: mayplot
### Keywords: hplot

### ** Examples

vLis <-
 varlist(d = list(type="grid", value = c(10, 100, 1000)),
         family=list(type="grid", value = c("Clayton", "Gumbel")),
         tau = list(type="grid", value = c(0.25, 0.5)),
         alpha = list(type="inner", value = c(0.95, 0.99, 0.999)))

iP <- c(4, 1:3)# <- permutation, putting alpha first
dNms <- mkNms(vLis)[iP]
## an array as from  x <- getArray( doMclapply(vLis, ..) ) :
x <- array(
    c(6.1981, 8.0478, 8.4265, 46.883, 74.359, 86.4394, 432.585, 743.27, 859.35,
      4.8508, 6.0286, 6.3965, 26.380, 35.132, 47.1517, 243.113, 311.36, 342.84,
      7.8546, 8.9769, 9.2199, 78.235, 89.493, 92.2875, 785.674, 893.63, 923.62,
      7.7164, 8.2866, 8.8169, 75.959, 82.806, 88.0626, 756.786, 831.65, 874.70),
    dim = sapply(dNms, length), dimnames = dNms)

mayplot(x, vLis, row.vars="family", col.vars="tau", xvar="alpha", log="y",
       ylab=bquote(widehat(VaR)[alpha]))
## the same, but no xlab and no ylab :
mayplot(x, vLis, row.vars="family", col.vars="tau", xvar="alpha", log="y", xlab=NA)
## Don't show: 
## Should also work, identically:
for(i in 1:5) ## use a random permutation of x's dimensions:
 mayplot(aperm(x, sample(4)),
        vLis, row.vars="family", col.vars="tau", xvar="alpha", log="y")
## End(Don't show)



