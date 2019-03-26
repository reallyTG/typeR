library(LaF)


### Name: detect_dm_csv
### Title: Automatically detect data models for CSV-files
### Aliases: detect_dm_csv

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
write.table(testdata, file="tmp.csv", row.names=FALSE, col.names=TRUE, sep=',')

# Detect data model
model <- detect_dm_csv("tmp.csv", header=TRUE)

# Create LaF-object
laf <- laf_open(model)




