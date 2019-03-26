library(dataPreparation)


### Name: findAndTransformDates
### Title: Identify date columns
### Aliases: findAndTransformDates

### ** Examples

# Load exemple set
data(messy_adult)
head(messy_adult)
# using the findAndTransformDates
findAndTransformDates(messy_adult, n_test = 5)
head(messy_adult)

# Example with ambiguities
## Not run: 
##D require(data.table)
##D data(messy_adult) # reload data
##D # Add an ambiguity by sorting date1
##D messy_adult$date1 = sort(messy_adult$date1, na.last = TRUE)
##D # Try all three methods:
##D result_1 = findAndTransformDates(copy(messy_adult))
##D result_2 = findAndTransformDates(copy(messy_adult), ambiguities = "WARN")
##D result_3 = findAndTransformDates(copy(messy_adult), ambiguities = "SOLVE")
## End(Not run)
# "##NOT RUN:" mean that this example hasn't been run on CRAN since its long. But you can run it!



