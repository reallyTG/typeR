library(lessR)


### Name: Sort
### Title: Sort the Rows of a Data Frame
### Aliases: Sort srt
### Keywords: sort

### ** Examples

# construct data frame
d <- read.table(text="Severity Description
1 Mild
4 Moderate
3 Moderate
2 Mild
1 Severe", header=TRUE)

# sort the data frame called d according to Severity
#   in ascending order
d <- Sort(Severity)

# abbreviated form, replace original with sorted
d <- srt(Severity)

# sort Description in descending order, sort Severity within
#  each level of Description in ascending order
d <- Sort(c(Description, Severity), direction=c("-", "+"))  

# data in a different data frame than d
data(dataEmployee)
d <- Sort(Gender, data=dataEmployee)

# sort by row names in ascending order
d <- Read("Employee", in.lessR=TRUE)
d <- Sort(row.names)

# randomly re-shuffle the rows of data
d <- Read("Employee", in.lessR=TRUE)
d <- Sort(random)



