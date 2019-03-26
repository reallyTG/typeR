library(SemNetCleaner)


### Name: splitstr.check
### Title: Split String Check
### Aliases: splitstr.check

### ** Examples

#create long word vector
vec <- "bombay opossum guinea pig horse cow"

#split vector
split <- strsplit(vec, " ")[[1]]

## No test: 
splitstr.check(split, animals.database)
## End(No test)




