library(BIGL)


### Name: constructFormula
### Title: Construct a model formula from parameter constraint matrix
### Aliases: constructFormula

### ** Examples

  constM <- rbind(c(0, 0, 1, 0, 0, 0, 0),
                  c(0, 0, 0, -1, 1, 0, 0))
  constV <- c(0.9, 0)
  constructFormula(constM, constV)



