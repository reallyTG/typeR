library(DiscreteFDR)


### Name: fisher.pvalues.support
### Title: Computing discrete p-values and their support for Fisher's exact
###   tests
### Aliases: fisher.pvalues.support

### ** Examples

X1 <- c(4, 2, 2, 14, 6, 9, 4, 0, 1)
X2 <- c(0, 0, 1, 3, 2, 1, 2, 2, 2)
N1 <- rep(148, 9)
N2 <- rep(132, 9)
Y1 <- N1-X1
Y2 <- N2-X2
df <- data.frame(X1,Y1,X2,Y2)
df
#Construction of the p-values and their support
df.formatted <- fisher.pvalues.support(counts = df, input = "noassoc")
raw.pvalues <- df.formatted$raw
pCDFlist <- df.formatted$support

data(amnesia)
#We only keep the first 100 lines to keep the computations fast.
#We also drop the first column to keep only columns of counts, in the Heller & Gur (2011) setting.
amnesia <- amnesia[1:100,2:3]
#Construction of the p-values and their support
amnesia.formatted <- fisher.pvalues.support(counts = amnesia, input = "HG2011")
raw.pvalues <- amnesia.formatted$raw
pCDFlist <- amnesia.formatted$support



