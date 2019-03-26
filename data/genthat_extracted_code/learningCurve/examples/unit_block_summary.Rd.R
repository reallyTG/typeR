library(learningCurve)


### Name: unit_block_summary
### Title: Block Summary Function
### Aliases: unit_block_summary

### ** Examples

# A production block runs from unit 201 to unit 500 inclusive.
# The 201st unit had a required time of 125 hours with a 75% 
# learning curve, what is the block summary?

unit_block_summary(t = 125, m = 201, n = 500, r = .75)
## $`block units`
## [1] 300

## $`block hours`
## [1] 30350.48

## $`midpoint unit`
## [1] 334.6103

## $`midpoint hours`
## [1] 101.1683




