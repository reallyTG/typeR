library(readr)


### Name: melt_table
### Title: Return melted data for each token in a whitespace-separated file
### Aliases: melt_table melt_table2

### ** Examples

# One corner from http://www.masseyratings.com/cf/compare.htm
massey <- readr_example("massey-rating.txt")
cat(read_file(massey))
melt_table(massey)

# Sample of 1978 fuel economy data from
# http://www.fueleconomy.gov/feg/epadata/78data.zip
epa <- readr_example("epa78.txt")
cat(read_file(epa))
melt_table(epa)



