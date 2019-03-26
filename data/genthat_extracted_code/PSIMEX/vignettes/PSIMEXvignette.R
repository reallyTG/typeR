## R code for the vignette of PSIMEX
## ----custom, echo = FALSE, results ='hide', message = FALSE, warning = FALSE----
#library(knitr)
# opts_chunk$set(
#fig.path='plots/p', echo = FALSE, results='hide', cache=TRUE
#)
         library("PSIMEX")
         data(pedigree)
         data(data)
         initial <- PSIMEX:::initial 
         initial_herit <- PSIMEX:::initial_herit
         extrapolation <- PSIMEX:::extrapolation
         fit.nls <- PSIMEX:::fit.nls
         plot.Psimex <- PSIMEX:::plot.Psimex
         plot.simul.Psimex <- PSIMEX:::plot.simul.Psimex
         Psimex <- PSIMEX:::Psimex
         simul.na <- PSIMEX:::simul.na
         simul.na.top <- PSIMEX:::simul.na.top
         simul.na.bottom <- PSIMEX:::simul.na.bottom
         simul.na.uni <- PSIMEX:::simul.na.uni
         simul.na.top.herit <- PSIMEX:::simul.na.top.herit
         simul.na.bottom.herit <- PSIMEX:::simul.na.bottom.herit
         simul.na.uni.herit <- PSIMEX:::simul.na.uni.herit
         simul.replace <- PSIMEX:::simul.replace
         simul.replace.uni <- PSIMEX:::simul.replace.uni
         simul.replace.similar <- PSIMEX:::simul.replace.similar
         simul.replace.uni.herit <- PSIMEX:::simul.replace.uni.herit
         simul.replace.similar.herit <- PSIMEX:::simul.replace.similar.herit

         cairo.ps <- grDevices:::cairo_ps
         dev.off <- grDevices:::dev.off
         

## ----plotsetup = 'hide', echo = FALSE------------------------------------
mycairo <- function(name, width, height, ...) {
   cat("using cairo")
   grDevices::cairo.ps(file = paste(name, "eps", sep = "."),
                          width = width, height = height)
}
mycairo.off <- function() {
   cat("shutting down cairo\n")
   grDevices::dev.off()
}

## ----PS-setup, echo = FALSE, results ='hide', message = FALSE, warning = FALSE----
options(width=50)
         
pkgs <- c("PSIMEX", "MCMCglmm", "plotrix", "pedigree", "psych", "AICcmodavg")
          stopifnot(all(sapply(pkgs, require, character.only = TRUE)))
          
set.seed(29)

## ----pedigreedata, echo = TRUE, results ='markup', message = FALSE, warning = FALSE----
 pedigree0 <- pedigree
 head(pedigree0)

## ----data, echo = TRUE, results ='markup', message = FALSE, warning = FALSE----

 head(data)

## ----replinb, echo = TRUE, results ='markup', message = FALSE, warning = FALSE----
lambda <- c(0.2, 0.3, 0.4, 0.5, 0.6)
lambda0 <- 0.1
model <- lm(y~sex+f_inb, data = data)
 
results_mis <- Psimex(pedigree0, data, 
                  lambda, lambda0, B = 10, 
                  model, parameter = "inbreeding", 
                  error = "misassignment", way = "uniform", 
                  fitting.method = c("linear", "quadratic"), 
                  ntop = NA, nbottom = NA, 
                  prior, nitt, thin, burnin)
 results_mis$description
 results_mis$error
 results_mis$fitting.method
 results_mis$way
 
 results_mis$extrapolated_data 
 results_mis$lambda
 results_mis$lambda0 
 results_mis$starting.value

## ----replinbs, echo = TRUE, results ='markup', message = FALSE, warning = FALSE----
lambda <- c(0.2, 0.3, 0.4, 0.5, 0.6)
lambda0 <- 0.1
model <- lm(y~sex+f_inb, data = data)
 
results_mis1 <- Psimex(pedigree0, data, 
                  lambda, lambda0, B = 10, 
                  model, parameter = "inbreeding", 
                  error = "misassignment", way = "similar", 
                  fitting.method = c("quadratic", "cubic"), 
                  ntop = NA, nbottom = NA, 
                  prior, nitt, thin, burnin)
 results_mis1$description
 results_mis1$error
 results_mis1$fitting.method
 results_mis1$way
 
 results_mis1$extrapolated_data 
 results_mis1$lambda
 results_mis1$lambda0 
 results_mis1$starting.value

