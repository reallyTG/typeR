## ----setup, results='hide', messages=FALSE, warnings=FALSE---------------
library(harvestr)
library(plyr)
library(MCMCpack)
library(dostats)
print.data.frame <- function(x, ...){
  print(ascii(df, include.rownames = FALSE), type = 'rest')
}

## ----ex1-setup-----------------------------------------------------------
library(harvestr)
library(plyr)
seeds <- gather(100, seed=12345)

## ----ex1-generate_data---------------------------------------------------
datasets <- farm(seeds, {
  x <- rnorm(100)
  y <- rnorm(100, mean=x)
  data.frame(y,x)
})

## ----r ex1-analysis------------------------------------------------------
analyses <-  harvest(datasets, lm)

## ----ex1-summarize-------------------------------------------------------
library(dostats)
coefs <- t(sapply(analyses, coef))
adply(coefs,2, dostats, mean, sd)

## ----stochastic, message=F, warning=F------------------------------------
library(MCMCpack)
library(plyr)
posteriors <- harvest(datasets, MCMCregress, formula=y~x)
dataframes <- harvest(posteriors, as.data.frame)
X.samples  <- harvest(dataframes, `[[`, "x")
densities  <- harvest(X.samples, density)

## ----fig=T---------------------------------------------------------------
plot(densities[[1]])
l_ply(densities, lines)

## ----caching_run1--------------------------------------------------------
unlink("harvestr-cache", recursive=TRUE)  # reset cache
system.time({
    posteriors1 <- harvest(datasets, MCMCregress, formula=y~x, cache=TRUE)
})

## ----cache_run2----------------------------------------------------------
system.time({
    posteriors2 <- harvest(datasets, MCMCregress, formula=y~x, cache=TRUE)
})

