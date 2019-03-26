library(InterVA4)


### Name: InterVA
### Title: Provide InterVA4 analysis on the data input.
### Aliases: InterVA
### Keywords: InterVA

### ** Examples

data(SampleInput)
## to get easy-to-read version of causes of death make sure the column
## orders match interVA4 standard input this can be monitored by checking
## the warnings of column names

sample.output1 <- InterVA(SampleInput, HIV = "h", Malaria = "l", directory = "VA test",
    filename = "VA_result", output = "extended", append = FALSE, replicate = FALSE)

## to get causes of death with group code for further usage
sample.output2 <- InterVA(SampleInput, HIV = "h", Malaria = "l", directory = "VA test",
    filename = "VA_result_wt_code", output = "classic", append = FALSE,
    replicate = FALSE, groupcode = TRUE)



