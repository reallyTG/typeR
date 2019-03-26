library(BBmisc)


### Name: isExpensiveExampleOk
### Title: Conditional checking for expensive examples.
### Aliases: isExpensiveExampleOk

### ** Examples

# extremely costly random number generation, that we dont want checked on CRAN
if (isExpensiveExampleOk()) {
  runif(1)
}



