library(iemisc)


### Name: benefitcost
### Title: Benefit-Cost Ratio (Engineering Economics)
### Aliases: benefitcost

### ** Examples

library(iemisc)
# Example from Lindeburg Reference text (page 14-4)
benefitcost(ic1 = 300000, n1 = 10, ac1 = 45000, ab1 = 150000, i1 = 10,
salvage1 = 0, ic2 = 400000, n2 = 10, ac2 = 35000, ab2 = 200000, i2 = 10,
salvage2 = 10000, option1 = "A", option2 = "B", table = "rtable")


# This is useful for saving the results as the named data.frame rtable
rtable <- benefitcost(ic1 = 300000, n1 = 10, ac1 = 45000, ab1 = 150000,
i1 = 10, salvage1 = 0, ic2 = 400000, n2 = 10, ac2 = 35000, ab2 = 200000,
i2 = 10, salvage2 = 10000, option1 = "A", option2 = "B", table = "rtable")

rtable


# This is useful for saving the results as the named data.frame ptable
ptable <- benefitcost(ic1 = 300000, n1 = 10, ac1 = 45000, ab1 = 150000,
i1 = 10, salvage1 = 0, ic2 = 400000, n2 = 10, ac2 = 35000, ab2 = 200000,
i2 = 10, salvage2 = 10000, option1 = "A", option2 = "B", table = "ptable")

ptable


# This is useful for saving the results as the named list of 2 data.frames
# called both
both <- benefitcost(ic1 = 300000, n1 = 10, ac1 = 45000, ab1 = 150000,
i1 = 10, salvage1 = 0, ic2 = 400000, n2 = 10, ac2 = 35000, ab2 = 200000,
i2 = 10, salvage2 = 10000, option1 = "A", option2 = "B", table = "both")


both


# Example 10-8 from the Sullivan Reference text (page 452-453)
project <- benefitcost(ic1 = 750000, n1 = 35, ac1 = 120000, ab1 = 245000,
i1 = 9, salvage1 = 0, ic2 = 625000, n2 = 25, ac2 = 110000, ab2 = 230000,
i2 = 9, salvage2 = 0, option1 = "Project I", option2 = "Project II",
table = "rtable")

project






