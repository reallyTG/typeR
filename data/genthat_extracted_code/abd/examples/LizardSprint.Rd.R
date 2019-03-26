library(abd)


### Name: LizardSprint
### Title: Sprint Speeds in Canyon Lizards
### Aliases: LizardSprint
### Keywords: datasets

### ** Examples

histogram(~ speed, LizardSprint)
Lizard2 <- aggregate(speed ~ lizard, LizardSprint, mean)
histogram(~ speed, Lizard2)



