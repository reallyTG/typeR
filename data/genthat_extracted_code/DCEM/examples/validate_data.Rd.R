library(DCEM)


### Name: validate_data
### Title: validate_data: Part of DCEM package.
### Aliases: validate_data

### ** Examples

#Generate a dataframe with 2 columns containing random values.

# Check a range of columns.

validate_data("2,3,4", ncol(as.data.frame(cbind(sample(1:100,10),
sample(500:1000, 10), sample(-100:0,10)))))

# Check a single column.

validate_data("2", ncol(as.data.frame(cbind(sample(1:100,10),
sample(500:1000, 10)))))




