library(arulesViz)


### Name: inspectDT
### Title: Inspect Associations Interactively Using datatable
### Aliases: inspect inspectDT datatable
### Keywords: print

### ** Examples

## Not run: 
##D data(Groceries)
##D rules <- apriori(Groceries, parameter=list(support=0.005, confidence=0.5))
##D rules
##D 
##D inspectDT(rules)
##D 
##D ### save table as a html page.
##D p <- inspectDT(rules)
##D htmlwidgets::saveWidget(p, "arules.html", selfcontained = FALSE)
##D browseURL("arules.html")
## End(Not run)



