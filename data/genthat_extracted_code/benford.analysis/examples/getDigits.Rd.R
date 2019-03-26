library(benford.analysis)


### Name: getDigits
### Title: Gets the data starting with some specific digits
### Aliases: getDigits

### ** Examples

data(census.2000_2010) #gets data

#generates benford object
c2010 <- benford(census.2000_2010$pop.2010) 

#subsets data starting with digits 10 and 25
digits.10.25 <- getDigits(c2010, census.2000_2010, c(10,25)) 



