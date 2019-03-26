library(InterVA5)


### Name: CSMF5
### Title: Summarize and plot a population level distribution of va
###   probabilities.
### Aliases: CSMF5
### Keywords: interVA

### ** Examples


## Not run: 
##D data(RandomVA5)
##D # only fit first 20 observations for a quick illustration
##D RandomVA5 <- RandomVA5[1:20, ]
##D 
##D sample.output <- InterVA5(RandomVA5, HIV = "h", Malaria = "v", write = FALSE, 
##D        directory = tempdir(), filename = "VA5_result", output = "extended", 
##D        append = FALSE)
##D 
##D ## Get CSMF by considering only top 3 causes reported by InterVA5.
##D ## This is equivalent to using CSMF.interVA5() command Note that
##D ## it's different from using all top 3 causses, since they may not
##D ## all be reported
##D CSMF.summary <- CSMF5(sample.output, InterVA.rule = TRUE,
##D    noplot = TRUE)
##D 
##D ## Population level summary using pie chart
##D CSMF.summary2 <- CSMF5(sample.output, type = "pie",
##D  min.prob = 0.01, main = "population COD distribution using pie chart",
##D  clockwise = FALSE, radius = 0.7, cex = 0.7, cex.main = 0.8)
##D 
##D ## Population level summary using bar chart
##D CSMF.summary3 <- CSMF5(sample.output, type = "bar",
##D   min.prob = 0.01, main = "population COD distribution using bar chart",
##D   cex.main = 1)
##D CSMF.summary4 <- CSMF5(sample.output, type = "bar",
##D   top.plot = 5, main = "Top 5 population COD distribution",
##D   cex.main = 1)
## End(Not run)




