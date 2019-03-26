library(InterVA5)


### Name: CSMF.interVA5
### Title: Summarize population level cause-specific mortality fraction as
###   InterVA5 suggested.
### Aliases: CSMF.interVA5
### Keywords: interVA

### ** Examples


## Not run: 
##D data(RandomVA5)
##D # only fit first 20 observations for a quick illustration
##D RandomVA5 <- RandomVA5[1:20, ]
##D 
##D sample.output <- InterVA5(RandomVA5, HIV = "h", Malaria = "v", write=TRUE,
##D        directory = tempdir(), filename = "VA5_result", output = "extended", append = FALSE)
##D ## Get CSMF without plots
##D csmf <- CSMF.interVA5(sample.output$VA5)
## End(Not run)




