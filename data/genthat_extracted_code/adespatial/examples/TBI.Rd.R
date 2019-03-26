library(adespatial)


### Name: TBI
### Title: TBI: Difference between multivariate observations at T1 and T2
### Aliases: TBI

### ** Examples

if(require("vegan", quietly = TRUE)) {

## Example 1 -

## Invertebrate communities subjected to insecticide treatment.

## As an example in their paper on Principal Response Curves (PRC method), van den
## Brink & ter Braak (1999) used observations on the abundances of 178 invertebrate
## species (macroinvertebrates and zooplankton) subjected to treatments in 12 mesocosms by
## the insecticide chlorpyrifos. The mesocosms were sampled at 11 occasions. The data,
## available in the {vegan} package, are log-transformed species abundances, ytranformed =
## log(10*y+1).

## The data of survey #4 will be compared to those of survey #11 in this example.
## Survey #4 was carried out one week after the insecticide treatment, whereas the fauna
## of the mesocosms was considered by the authors to have fully recovered from the
## insecticide treatment at survey #11.

data(pyrifos)

## The mesocosms had originally been attributed at random to the treatments. However,
## to facilitate presentation of the results, they will be listed here in order of
## increased insecticide doses: {0, 0, 0, 0, 0.1, 0.1, 0.9, 0.9, 6, 6, 44, 44} micro g/L.

## Select the 12 data rows of surveys 4 and 11 from the data file and reorder them

ord4 = c(38,39,41,47,37,44,40,46,43,48,42,45)

ord11 = c(122,123,125,131,121,128,124,130,127,132,126,129)

## Run the TBI function

res1 <- TBI(pyrifos[ord4,], pyrifos[ord11,], method = "%diff", nperm = 0, test.t.perm = FALSE)

res1$BCD.mat

## Example 2 -

## This example uses the mite data available in vegan. Let us pretend that sites 1-20
## represent T1 and sites 21-40 represent T2.


data(mite)

# Run the TBI function

res2 <- TBI(mite[1:20,], mite[21:40,], method = "%diff", nperm = 0, test.t.perm = FALSE)

summary(res2)

res2$BCD.mat

}



