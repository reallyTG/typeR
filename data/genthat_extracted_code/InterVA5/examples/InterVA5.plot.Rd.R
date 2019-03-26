library(InterVA5)


### Name: InterVA5.plot
### Title: Plot an individual-level distribution of va probabilities.
### Aliases: InterVA5.plot
### Keywords: InterVA

### ** Examples


## Not run: 
##D data(RandomVA5)
##D # only fit first 20 observations for a quick illustration
##D RandomVA5 <- RandomVA5[1:20, ]
##D #' sample.output <- InterVA5(RandomVA5, HIV = "h", Malaria = "v", write = FALSE, 
##D     directory = tempdir(), filename = "VA5_result", output = "extended", append = FALSE)
##D 
##D ## Individual level summary using pie chart
##D InterVA5.plot(sample.output$VA5[[3]], type = "pie", min.prob = 0.01,
##D     main = "1st sample VA analysis using pie chart", clockwise = FALSE,
##D     radius = 0.6, cex = 0.6, cex.main = 0.8)
##D 
##D 
##D ## Individual level summary using bar chart
##D InterVA5.plot(sample.output$VA5[[3]], type = "bar", min.prob = 0.01,
##D     main = "2nd sample VA analysis using bar chart", cex.main = 0.8)
## End(Not run)




