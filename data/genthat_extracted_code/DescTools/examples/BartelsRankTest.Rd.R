library(DescTools)


### Name: BartelsRankTest
### Title: Bartels Rank Test of Randomness
### Aliases: BartelsRankTest
### Keywords: htest

### ** Examples

## Example 5.1 in Gibbons and Chakraborti (2003), p.98.
## Annual data on total number of tourists to the United States for 1970-1982.

years <- 1970:1982
tourists <- c(12362, 12739, 13057, 13955, 14123,  15698, 17523, 18610, 19842,
      20310, 22500, 23080, 21916)
plot(years, tourists, pch=20)

BartelsRankTest(tourists, alternative="trend", method="beta")

#  Bartels Ratio Test
#
# data:  tourists
# statistic = -3.6453, n = 13, p-value = 1.21e-08
# alternative hypothesis: trend


## Example in Bartels (1982).
## Changes in stock levels for 1968-1969 to 1977-1978 (in $A million), deflated by the
## Australian gross domestic product (GDP) price index (base 1966-1967).
x <- c(528, 348, 264, -20, - 167, 575, 410, -4, 430, - 122)

BartelsRankTest(x, method="beta")



