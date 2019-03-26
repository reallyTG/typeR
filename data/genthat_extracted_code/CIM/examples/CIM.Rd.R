library(CIM)


### Name: CIM
### Title: Compositional Impact of Migration
### Aliases: CIM

### ** Examples

## Read in the two data.frames included in the package
m <- male
f <- female

## Run the function using "ratio" calculation
CIM.ratio <- CIM(m, f, calculation = "ratio", numerator = 1, denominator = 2)
## Print the resulted data.frame
CIM.ratio

## Run the function using "percentage" calculation
CIM.percentage <- CIM(m, f, calculation = "percentage", numerator = 1, denominator = 2)
## See the resulted data.frame
CIM.percentage

## For the Duncan index, we compute impact of internal migration on the spatial pattern of
## residential age segregation of people age 65 and over in the
## local authority districts of Greater London using 2011 census data.
## Chosen group: people aged 65 and over.
## Reference category: the rest of age groups.
## For this example, this group is people aged pop1-14, 15-29, 30-14 and 45-64).
CIM.duncan <- CIM(pop65over, pop1_14, pop15_29, pop30_44, pop45_64,
calculation = "duncan", numerator = 1, DuncanAll= TRUE)
CIM.duncan$duncan_results
CIM.duncan$duncan_index





