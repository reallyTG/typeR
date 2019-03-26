## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=4.5, 
  fig.height=3.5
)

## ---- message=FALSE------------------------------------------------------
set.seed(1)
library(updog)
nind    <- 100
ploidy  <- 6
sizevec <- round(stats::runif(n   = nind, 
                              min = 50, 
                              max = 200))

## ------------------------------------------------------------------------
true_geno <- rgeno(n      = nind, 
                   ploidy = ploidy,
                   model  = "f1", 
                   p1geno = 4,
                   p2geno = 5)

## ------------------------------------------------------------------------
refvec <- rflexdog(sizevec = sizevec, 
                   geno    = true_geno, 
                   ploidy  = ploidy, 
                   seq     = 0.001, 
                   bias    = 0.7, 
                   od      = 0.005)

## ------------------------------------------------------------------------
plot_geno(refvec  = refvec, 
          sizevec = sizevec, 
          ploidy  = ploidy, 
          bias    = 0.7, 
          seq     = 0.001,
          geno    = true_geno)

## ------------------------------------------------------------------------
fout <- flexdog(refvec  = refvec, 
                sizevec = sizevec, 
                ploidy  = ploidy, 
                model   = "f1")

## ------------------------------------------------------------------------
plot(fout)

## Estimated proportion misgenotyped
fout$prop_mis

## Actual proportion misgenotyped
mean(fout$geno != true_geno)

## ------------------------------------------------------------------------
true_geno <- rgeno(n      = nind,
                   ploidy = ploidy,
                   model  = "hw", 
                   allele_freq = 0.75)
refvec <- rflexdog(sizevec = sizevec, 
                   geno    = true_geno, 
                   ploidy  = ploidy, 
                   seq     = 0.001, 
                   bias    = 0.7, 
                   od      = 0.005)
fout <- flexdog(refvec  = refvec, 
                sizevec = sizevec, 
                ploidy  = ploidy, 
                model   = "hw")
plot(fout)

## Estimated proportion misgenotyped
fout$prop_mis

## Actual proportion misgenotyped
mean(fout$geno != true_geno)

## Estimated allele frequency close to true allele frequency
fout$par$alpha

