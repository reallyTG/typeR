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
data("snpdat")

## ---- message=FALSE------------------------------------------------------
library(tidyverse)
snpdat %>% 
  filter(snp == "SNP1") %>%
  select(counts, size, id) ->
  smalldat
head(smalldat)

## ------------------------------------------------------------------------
pref    <- smalldat$counts[1]
psize   <- smalldat$size[1]
oref    <- smalldat$counts[-1]
osize   <- smalldat$size[-1]
ploidy  <- 6 # sweet potatoes are hexaploid

## ---- warning=FALSE------------------------------------------------------
plot_geno(refvec = oref, sizevec = osize, ploidy = ploidy)

## ------------------------------------------------------------------------
uout <- flexdog(refvec  = oref, 
                sizevec = osize, 
                ploidy  = ploidy, 
                model   = "s1", 
                p1ref   = pref, 
                p1size  = psize)

## ------------------------------------------------------------------------
plot(uout)

## ------------------------------------------------------------------------
uout$prop_mis

