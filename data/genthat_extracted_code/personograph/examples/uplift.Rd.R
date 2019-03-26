library(personograph)


### Name: uplift
### Title: "Uplift" from IER and CER
### Aliases: uplift

### ** Examples

ier <- 0.06368133
cer <- 0.1115242
u <- uplift(ier, cer, higher_is_better=TRUE)
plot(u)



