library(paleotree)


### Name: occData2timeList
### Title: Converting Occurrences Data to a timeList Data Object
### Aliases: occData2timeList

### ** Examples

data(graptPBDB)

graptOccSpecies <- taxonSortPBDBocc(graptOccPBDB,rank = "species",onlyFormal = FALSE)
graptTimeSpecies <- occData2timeList(occList = graptOccSpecies)

head(graptTimeSpecies[[1]])
head(graptTimeSpecies[[2]])

graptOccGenus <- taxonSortPBDBocc(graptOccPBDB,rank = "genus",onlyFormal = FALSE)
graptTimeGenus <- occData2timeList(occList = graptOccGenus)

layout(1:2)
taxicDivDisc(graptTimeSpecies)
taxicDivDisc(graptTimeGenus)

# the default interval calculation is "dateRange"
# let's compare to the other option, "occRange"
	# for species

graptOccRange <- occData2timeList(occList = graptOccSpecies, intervalType = "occRange")

#we would expect no change in the diversity curve
	#because there are only changes in th
		#earliest bound for the FAD
		#latest bound for the LAD
#so if we are depicting ranges within maximal bounds
	#dateRanges has no effect
layout(1:2)
taxicDivDisc(graptTimeSpecies)
taxicDivDisc(graptOccRange)
#yep, identical

#so how much uncertainty was gained by using dateRange?

# write a simple function for getting uncertainty in first and last
		# appearance dates from a timeList object
sumAgeUncert <- function(timeList){
	fourDate <- timeList2fourDate(timeList)
	perOcc <- (fourDate[,1]-fourDate[,2])+(fourDate[,3]-fourDate[,4])
	sum(perOcc)
	}

#total amount of uncertainty in occRange dataset
sumAgeUncert(graptOccRange)
#total amount of uncertainty in dateRange dataset
sumAgeUncert(graptTimeSpecies)
#the difference
sumAgeUncert(graptOccRange)-sumAgeUncert(graptTimeSpecies)
#as a proportion
1-(sumAgeUncert(graptTimeSpecies)/sumAgeUncert(graptOccRange))

#a different way of doing it
dateChange <- timeList2fourDate(graptTimeSpecies)-timeList2fourDate(graptOccRange)
apply(dateChange,2,sum)
#total amount of uncertainty removed by dateRange algorithm
sum(abs(dateChange))

layout(1)



