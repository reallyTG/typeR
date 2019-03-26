library(lessR)


### Name: Read
### Title: Read Contents of a Data File with Optional Variable Labels and
###   Feedback
### Aliases: Read rd rd.brief Read2
### Keywords: read csv

### ** Examples

# remove the # sign before each of the following Read statements to run

# to browse for a data file on the computer system, invoke Read with 
#   the ref argument empty
# d <- Read()
# abbreviated name
# d <- rd()
# reduced output to the console
# d <- rd.brief()

# browse for a file and then read the variable labels from
#  the specified label file, here a Excel file with two columns,
#  the first column of variable names and the second column the 
#  corresponding labels
# d <- Read(labels="employee_lbl.xlsx")

# same as above, but include standard read.csv options to indicate 
#  no variable names in first row of the csv data file 
#   and then provide the names
# also indicate that the first column is an ID field
# d <- Read(header=FALSE, col.names=c("X", "Y"), row.names=1)

# read a csv data file from the web
# d <- Read("http://web.pdx.edu/~gerbing/data/twogroup.csv")

# read a csv data file with -99 and XXX set to missing
# d <- Read(missing=c(-99, "XXX"))

# do not display any output
# d <- Read(quiet=TRUE)
# display full output
# d <- Read(brief=FALSE)

# read the built-in data set dataEmployee
d <- Read("Employee", in.lessR=TRUE)

# read a data file organized by columns, with a 
#   5 column ID field, 2 column Age field
#   and 75 single columns of data, no spaces between columns
#   name the variables with lessR function: to
#   the variable names are Q01, Q02, ..., Q74, Q75
# d <- Read(widths=c(5,2,rep(1,75)), col.names=c("ID", "Age", to("Q", 75)))



