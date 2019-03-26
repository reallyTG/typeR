library(InterVA5)


### Name: COMCAT.interVA5
### Title: Summarize population level mortality fraction by Circumstance of
###   Mortality Category
### Aliases: COMCAT.interVA5
### Keywords: interVA

### ** Examples


## Not run: 
##D data(RandomVA5)
##D # only fit first 20 observations for a quick illustration
##D RandomVA5 <- RandomVA5[1:20, ]
##D 
##D sample.output <- InterVA5(RandomVA5, HIV = "h", Malaria = "v", 
##D        write=TRUE, directory = tempdir(),
##D        filename = "VA5_result", output = "extended", append = FALSE)
##D ## Get CSMF without plots
##D comcat <- COMCAT.interVA5(sample.output$VA5)
## End(Not run)




