library(ECoL)


### Name: complexity
### Title: Extract the complexity measures from datasets
### Aliases: complexity complexity.default complexity.formula

### ** Examples

## Extract all complexity measures
complexity(Species ~ ., iris)

## Extract the linearity measures
complexity(Species ~ ., iris, groups="linearity")



