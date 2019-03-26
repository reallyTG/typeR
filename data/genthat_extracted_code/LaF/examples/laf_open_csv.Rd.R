library(LaF)


### Name: laf_open_csv
### Title: Create a connection to a comma separated value (CSV) file.
### Aliases: laf_open_csv

### ** Examples

# Generate test data
ntest <- 10
column_types <- c("integer", "integer", "double", "string")
testdata <- data.frame(
    a = 1:ntest,
    b = sample(1:2, ntest, replace=TRUE),
    c = round(runif(ntest), 13),
    d = sample(c("jan", "pier", "tjores", "corneel"), ntest, replace=TRUE)
    )
# Write test data to csv file
write.table(testdata, file="tmp.csv", row.names=FALSE, col.names=FALSE, sep=',')

# Create LaF-object
laf <- laf_open_csv("tmp.csv", column_types=column_types)

# Read from file using indexing
first_column <- laf[ , 1]
first_row    <- laf[1, ]

# Read from file using blockwise operators
begin(laf)
first_block <- next_block(laf, nrows=2)
second_block <- next_block(laf, nrows=2)




