library(ShinyItemAnalysis)


### Name: theme_app
### Title: Complete theme for 'ShinyItemAnalysis' graphics
### Aliases: theme_app

### ** Examples

## Not run: 
##D data(GMAT)
##D data <- GMAT[, 1:20]
##D # total score calculation
##D df <- data.frame(score = apply(data, 1, sum))
##D # histogram
##D g <- ggplot(df, aes(score)) +
##D geom_histogram(binwidth = 1) +
##D xlab("Total score") +
##D ylab("Number of respondents")
##D 
##D g
##D g + theme_app()
## End(Not run)



