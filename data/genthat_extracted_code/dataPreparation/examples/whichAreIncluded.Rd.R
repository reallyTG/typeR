library(dataPreparation)


### Name: whichAreIncluded
### Title: Identify columns that are included in others
### Aliases: whichAreIncluded

### ** Examples

# Load toy data set
require(data.table)
data(messy_adult)

# Check for included columns
whichAreIncluded(messy_adult)

# Return columns that are also constant, double and bijection
# Let's add a truly just included column
messy_adult$are50OrMore <- messy_adult$age > 50
whichAreIncluded(messy_adult)

# As one can, see this column that doesn't have additional info than age is spotted.

# But you should be careful, if there is a column id, every column will be dropped:
messy_adult$id = 1:nrow(messy_adult) # build id
whichAreIncluded(messy_adult)



