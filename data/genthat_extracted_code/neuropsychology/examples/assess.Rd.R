library(neuropsychology)


### Name: assess
### Title: Compare a given score to a parent population.
### Aliases: assess

### ** Examples

require(neuropsychology)

assess(3.4, mean=2.5, sd=1.2)

df <- personality
assess(24, distribution=df$Age)



