library(TOSTER)


### Name: TOSTtwo.prop
### Title: TOST function for two proportions (raw scores)
### Aliases: TOSTtwo.prop

### ** Examples

## Equivalence test for two independent proportions equal to .65 and .70, with 100 samples
## per group, lower equivalence bound of -0.1, higher equivalence bound of 0.1, and alpha of 0.05.

TOSTtwo.prop(prop1 = .65, prop2 = .70, n1 = 100, n2 = 100,
   low_eqbound = -0.1, high_eqbound = 0.1, alpha = .05)




