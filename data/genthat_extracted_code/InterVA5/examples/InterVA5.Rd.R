library(InterVA5)


### Name: InterVA5
### Title: Provide InterVA5 analysis on the data input.
### Aliases: InterVA5
### Keywords: InterVA

### ** Examples


data(RandomVA5)
# only fit first 5 observations for a quick illustration
RandomVA5 <- RandomVA5[1:5, ]

## to get easy-to-read version of causes of death make sure the column
## orders match interVA5 standard input this can be monitored by checking
## the warnings of column names

sample.output1 <- InterVA5(RandomVA5, HIV = "h", Malaria = "l", write=FALSE, 
    directory = tempdir(), filename = "VA5_result", output = "extended", append = FALSE)

## Not run: 
##D ## to get causes of death with group code for further usage
##D sample.output2 <- InterVA5(RandomVA5, HIV = "h", Malaria = "l", 
##D     write = FALSE, directory = tempdir(), filename = "VA5_result_wt_code", output = "classic", 
##D     append = FALSE, groupcode = TRUE)
## End(Not run)





