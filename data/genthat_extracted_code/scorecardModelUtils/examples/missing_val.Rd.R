library(scorecardModelUtils)


### Name: missing_val
### Title: Missing value imputation
### Aliases: missing_val

### ** Examples

data <- iris
data$Species <- as.character(data$Species)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
data[sample(1:nrow(data),size=25),"Sepal.Length"] <- NA
data[sample(1:nrow(data),size=10),"Species"] <- NA

missing_list <- missing_val(base = data,target = "Y")
missing_list$base
missing_list$mapping_table



