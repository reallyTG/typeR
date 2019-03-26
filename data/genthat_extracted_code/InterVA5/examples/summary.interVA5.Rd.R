library(InterVA5)


### Name: summary.interVA5
### Title: Summary of the results obtained from InterVA5 algorithm
### Aliases: summary.interVA5
### Keywords: InterVA

### ** Examples

## Not run: 
##D data(RandomVA5)
##D # only fit first 20 observations for a quick illustration
##D RandomVA5 <- RandomVA5[1:20, ]
##D 
##D ## to get easy-to-read version of causes of death make sure the column
##D ## orders match interVA5 standard input this can be monitored by checking
##D ## the warnings of column names
##D 
##D sample.output1 <- InterVA5(RandomVA5, HIV = "h", Malaria = "l", 
##D     write = FALSE, directory = tempdir(), filename = "VA5_result", 
##D     output = "extended", append = FALSE)
##D 
##D summary(sample.output1)
##D summary(sample.output1, top = 10)
##D summary(sample.output1, id = "sample3")
## End(Not run)



