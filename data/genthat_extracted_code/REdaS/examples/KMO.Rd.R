library(REdaS)


### Name: Kaiser-Meyer-Olkin-Statistics
### Title: Kaiser-Meyer-Olkin Statistics
### Aliases: KMOS print.MSA_KMO

### ** Examples

set.seed(5L)
daten <- data.frame("A"=rnorm(100), "B"=rnorm(100), "C"=rnorm(100),
                    "D"=rnorm(100), "E"=rnorm(100))
cor(daten)
KMOS(daten, use = "pairwise.complete.obs")



