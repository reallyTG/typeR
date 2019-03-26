library(ALTopt)


### Name: convert.stress.level
### Title: Coding and decoding stress level
### Aliases: convert.stress.level

### ** Examples

## Not run: 
##D   # Generating D optimal design in coded unit.
##D   Design <- altopt.rc(optType = "D", N = 100, tc = 100, nf = 2, alpha = 1,
##D   formula = ~x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01))
##D 
##D   # Transform the coded unit to actual stress variable's level.
##D   convert.stress.level(lowStLv = c(34.834, 4.094), highStLv = c(30.288, 4.5),
##D   stand = Design$opt.design.rounded)
##D 
##D   # Transform the actual stress level to coded units.
##D   use <- c(38.281, 3.219)
##D   convert.stress.level(lowStLv = c(34.834, 4.094), highStLv = c(30.288, 4.5),
##D   actual = use)
##D   
## End(Not run)



