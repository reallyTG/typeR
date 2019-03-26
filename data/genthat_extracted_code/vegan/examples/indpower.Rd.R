library(vegan)


### Name: indpower
### Title: Indicator Power of Species
### Aliases: indpower
### Keywords: multivariate

### ** Examples

data(dune)
## IP values
ip <- indpower(dune)
## and TIP values
diag(ip) <- NA
(TIP <- rowMeans(ip, na.rm=TRUE))

## p value calculation for a species
## from Halme et al. 2009
## i is ID for the species
i <- 1
fun <- function(x, i) indpower(x)[i,-i]
## 'c0' randomizes species occurrences
os <- oecosimu(dune, fun, "c0", i=i, nsimul=99)
## get z values from oecosimu output
z <- os$oecosimu$z
## p-value
(p <- sum(z) / sqrt(length(z)))
## 'heterogeneity' measure
(chi2 <- sum((z - mean(z))^2))
pchisq(chi2, df=length(z)-1)
## Halme et al.'s suggested output
out <- c(TIP=TIP[i], 
    significance=p,
    heterogeneity=chi2,
    minIP=min(fun(dune, i=i)),
    varIP=sd(fun(dune, i=i)^2))
out



