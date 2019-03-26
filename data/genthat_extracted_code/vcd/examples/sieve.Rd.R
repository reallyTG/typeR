library(vcd)


### Name: sieve
### Title: Extended Sieve Plots
### Aliases: sieve sieve.default sieve.formula
### Keywords: hplot

### ** Examples

data("HairEyeColor")

## aggregate over 'sex':
(haireye <- margin.table(HairEyeColor, c(2,1)))

## plot expected values:
sieve(haireye, sievetype = "expected", shade = TRUE)

## plot observed table:
sieve(haireye, shade = TRUE)

## plot complete diagram:
sieve(HairEyeColor, shade = TRUE)

## example with observed values in the cells:
sieve(haireye, shade = TRUE, labeling = labeling_values,
               gp_text = gpar(fontface = 2))

## example with expected values in the cells:
sieve(haireye, shade = TRUE, labeling = labeling_values,
               value_type = "expected", gp_text = gpar(fontface = 2))

## an example for the formula interface:
data("VisualAcuity")
sieve(Freq ~ right + left,  data = VisualAcuity)




