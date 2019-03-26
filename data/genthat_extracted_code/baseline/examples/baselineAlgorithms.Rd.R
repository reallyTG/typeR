library(baseline)


### Name: baselineAlgorithms
### Title: List of available baseline algorithms
### Aliases: baselineAlgorithms
### Keywords: baseline

### ** Examples

## Get a list of all algorithms:
names(baselineAlgorithms)
## Show the descriptions
sapply(baselineAlgorithms, description)
## Add new algorithm
baseline.my.alg <- function(spectra, kappa=1, gamma=1){
   baseline  <- spectra-kappa+gamma
   corrected <- spectra-baseline
   list(baseline=baseline,corrected=corrected)
}

baselineAlgorithms$my.alg = new("baselineAlg",
     name = "my.alg",
     description = "A new baseline correction algorithm",
     funcName = "baseline.my.alg",
     param = data.frame(
        name = c("kappa","gamma"), # maxit
        integer = c(FALSE, FALSE),
        min = c(0, 0),
        incl.min = c(TRUE, TRUE),
        default = c(1, 1),
        max = c(Inf, 1),
        incl.max = c(FALSE, TRUE)
    ))



