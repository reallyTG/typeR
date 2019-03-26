library(InterVA4)


### Name: CSMF.interVA4
### Title: Summarize population level cause-specific mortality fraction as
###   InterVA4 suggested.
### Aliases: CSMF.interVA4
### Keywords: interVA

### ** Examples

data(SampleInput)
sample.output <- InterVA(SampleInput, HIV = "h", Malaria = "v", directory = "VA test",
       filename = "VA_result", output = "extended", append = FALSE)
## Get CSMF without plots
csmf<- CSMF.interVA4(sample.output$VA)
data(SampleInput)



