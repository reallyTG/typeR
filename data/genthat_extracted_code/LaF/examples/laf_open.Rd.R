library(LaF)


### Name: laf_open
### Title: Create a connection to a file using a data model.
### Aliases: laf_open

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

# Write data model to file
write_dm(laf, "tmp.yaml")

# Read data model and open file
laf <- laf_open(read_dm("tmp.yaml"))

# Write test data to second csv file
write.table(testdata, file="tmp2.csv", row.names=FALSE, col.names=FALSE, sep=',')

# Read data model and open seconde file, demonstrating the use of the optional
# arguments to laf_open
laf2 <- laf_open(read_dm("tmp.yaml"), filename="tmp2.csv")




