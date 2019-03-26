library(metansue)


### Name: metabias
### Title: Test for Funnel Plot Asymmetry for "meta.nsue" Objects
### Aliases: metabias metabias.meta.nsue
### Keywords: bias meta-analysis regression test

### ** Examples

t <- c(3.4, NA, NA, NA, NA, 2.8, 2.1, 3.1, 2.0, 3.4)
n <- c(40, 20, 22, 24, 18, 30, 25, 30, 16, 22)
m <- meta(smc_from_t(t, n))
metabias(m)



