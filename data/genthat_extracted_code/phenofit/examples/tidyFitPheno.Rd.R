library(phenofit)


### Name: tidyFitPheno
### Title: tidyFitPheno
### Aliases: tidyFitPheno

### ** Examples

library(phenofit)
# simulate vegetation time-series
fFUN = doubleLog.Beck
par  = c(
    mn  = 0.1,
    mx  = 0.7,
    sos = 50,
    rsp = 0.1,
    eos = 250,
    rau = 0.1)
t    <- seq(1, 365, 8)
tout <- seq(1, 365, 1)
y <- fFUN(par, t)

methods <- c("AG", "Beck", "Elmore", "Gu", "Zhang") # "Klos" too slow
fFITs <- curvefit(y, t, tout, methods)

# multiple years
fits <- list(`2001` = fFITs, `2002` = fFITs)
pheno <- get_pheno(fits, "AG", IsPlot=FALSE)

p <- tidyFitPheno(pheno)



