library(arulesViz)


### Name: plotly_arules
### Title: Interactive Scatter Plot for Association Rules using plotly
### Aliases: plotly plotly_arules
### Keywords: hplot

### ** Examples

## Not run: 
##D  
##D library(plotly)
##D data(Groceries)
##D rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.8))
##D rules
##D 
##D # interactive scatter plot visualization
##D plotly_arules(rules)
##D plotly_arules(rules, measure = c("support", "lift"), shading = "confidence")
##D plotly_arules(rules, method = "two-key plot")
##D 
##D # add jitter, change color and markers and add a title
##D plotly_arules(rules, jitter = 10, 
##D   marker = list(opacity = .7, size = 10, symbol = 1), 
##D   colors = c("blue", "green")) ##D 
##D 
##D 
##D # save a plot as a html page
##D p <- plotly_arules(rules)
##D htmlwidgets::saveWidget(p, "arules.html", selfcontained = FALSE)
##D browseURL("arules.html")
##D # Note: selfcontained seems to make the browser slow.
##D 
##D # interactive matrix visualization
##D plotly_arules(rules, method = "matrix") ##D 
## End(Not run)



