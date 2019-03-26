library(PELVIS)


### Name: bruzek02
### Title: Internal function for sexing the human os coxae using Bruzek's
###   method (2002)
### Aliases: bruzek02

### ** Examples

# Here we create manually an individual:
individual <- c(PrSu="M", GrSN="F", CArc="F", InfP="0", IsPu="F")
individual
# Determination produced by Bruzek (2002): female individual.
bruzek02(individual)



