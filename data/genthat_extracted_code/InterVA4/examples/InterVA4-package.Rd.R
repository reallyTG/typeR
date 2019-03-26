library(InterVA4)


### Name: InterVA4-package
### Title: Perform InterVA4 algorithm and provide graphical summarization
###   of COD distribution.
### Aliases: InterVA4 InterVA4-package
### Keywords: InterVA

### ** Examples

data(SampleInput)
sample.output <- InterVA(SampleInput, HIV = "h", Malaria = "v", directory = "VA test",
    filename = "VA_result", output = "extended", append = FALSE)



