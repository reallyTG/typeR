library(InterVA4)


### Name: summary.interVA
### Title: Summary of the results obtained from InterVA4 algorithm
### Aliases: summary.interVA
### Keywords: InterVA

### ** Examples

data(SampleInput)
## to get easy-to-read version of causes of death make sure the column
## orders match interVA4 standard input this can be monitored by checking
## the warnings of column names

sample.output1 <- InterVA(SampleInput, HIV = "h", Malaria = "l", directory = "VA test",
    filename = "VA_result", output = "extended", append = FALSE, replicate = FALSE)

summary(sample.output1)
summary(sample.output1, top = 10)
summary(sample.output1, id = "100532")



