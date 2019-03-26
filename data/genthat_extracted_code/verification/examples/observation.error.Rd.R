library(verification)


### Name: observation.error
### Title: Observation Error
### Aliases: observation.error
### Keywords: file

### ** Examples

obs <- round(runif(100))
gold <- round(runif(100) )
observation.error(obs, gold)

## Pirep gold standard

observation.error(c(43,10,17,4) )



