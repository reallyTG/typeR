library(rbounds)


### Name: FisherSens
### Title: Rosenbaum Sensitivity Analysis for Fisher's Exact Test
### Aliases: FisherSens

### ** Examples

## Fisher's Lady Tasting Tea: milk first or tea first?
LadyTastingTea <- matrix(c(4, 0, 0, 4), nrow = 2,
                         dimnames = list(Guess = c("Milk", "Tea"),
                                         Truth = c("Milk", "Tea")))
## Define "Milk" as "treated"/"success"
FisherSens(totalN = sum(LadyTastingTea), 
           treatedN = sum(LadyTastingTea["Milk", ]),
           totalSuccesses = sum(LadyTastingTea[, "Milk"]), 
           treatedSuccesses = sum(LadyTastingTea["Milk", "Milk"]), 
           Gammas = seq(1, 2, .2))
## Interpretation: Rejection of the null hypothesis 
## (that the lady cannot discriminate between milk-first and tea-first) 
## is insensitive to bias as large as Gamma = 2.



