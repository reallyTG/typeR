library(iemisc)


### Name: EffInt
### Title: Effective Interest rate (Engineering Economics)
### Aliases: EffInt

### ** Examples

library(iemisc)
# Example 4-28 from Sullivan Reference text (page 165)
EffInt(1.375, frequency = "month")
# the nominal interest rate per period (month) is 1.375%


# Example from SFPE Reference text
EffInt(18 / 12, frequency = "month")
# the nominal interest rate is 18% per year or 18% / 12 months






