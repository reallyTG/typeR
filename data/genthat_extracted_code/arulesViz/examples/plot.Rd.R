library(arulesViz)


### Name: plot
### Title: Visualize Association Rules and Itemsets
### Aliases: plot plot.itemsets plot.rules plot.grouped_matrix
### Keywords: hplot

### ** Examples

data(Groceries)
rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.8))
rules

## Scatterplot
## -----------
plot(rules)

## Scatterplot with custom colors
library(colorspace) # for sequential_hcl
plot(rules, control = list(col=sequential_hcl(100)))
plot(rules, col=sequential_hcl(100))
plot(rules, col=grey.colors(50, alpha =.8))

## See all control options using verbose
plot(rules, verbose = TRUE)

## Interactive plot (selected rules are returned)
## Not run: 
##D sel <- plot(rules, engine = "interactive")
## End(Not run)

## Create a html widget for interactive visualization
## Not run: 
##D plot(rules, engine = "htmlwidget")
## End(Not run)

## Two-key plot (is a scatterplot with shading = "order")
plot(rules, method = "two-key plot")

  
## Matrix shading
## --------------

## The following techniques work better with fewer rules
subrules <- subset(rules, lift>5)
subrules

## 2D matrix with shading
plot(subrules, method="matrix")

## 3D matrix
plot(subrules, method="matrix", engine = "3d")

## Matrix with two measures
plot(subrules, method="matrix", shading=c("lift", "confidence"))

## Reorder rules
plot(subrules, method="matrix", control = list(reorder = "none"))
plot(subrules, method="matrix", control = list(reorder = "support/confidence"))
plot(subrules, method="matrix", control = list(reorder = "similarity"))


## Interactive matrix plot (default interactive and as a html widget)
## Not run: 
##D plot(subrules, method="matrix", engine="interactive")
##D plot(subrules, method="matrix", engine="htmlwidget")
## End(Not run)

## Grouped matrix plot
## -------------------

plot(rules, method="grouped matrix")
plot(rules, method="grouped matrix", 
  col = grey.colors(10), 
  gp_labels = gpar(col = "blue", cex=1, fontface="italic"))

## Interactive grouped matrix plot
## Not run: 
##D sel <- plot(rules, method="grouped", engine = "interactive")
## End(Not run)

## Graphs
## ------

## Graphs only work well with very few rules
subrules2 <- sample(subrules, 25)

plot(subrules2, method="graph")

## Custom colors
plot(subrules2, method="graph", 
  nodeCol = grey.colors(10), edgeCol = grey(.7), alpha = 1)

## igraph layout generators can be used (see ? igraph::layout_)
plot(subrules2, method="graph", layout=igraph::in_circle())
plot(subrules2, method="graph", 
  layout=igraph::with_graphopt(spring.const=5, mass=50))

## Graph rendering using Graphviz
## Not run: 
##D plot(subrules2, method="graph", engine="graphviz")
## End(Not run)

## Default interactive plot (using igraph's tkplot)
## Not run: 
##D plot(subrules2, method="graph", engine = "interactive")
## End(Not run)

## Interactive graph as a html widget (using igraph layout)
## Not run: 
##D plot(subrules2, method="graph", engine="htmlwidget")
##D plot(subrules2, method="graph", engine="htmlwidget", 
##D   igraphLayout = "layout_in_circle")
## End(Not run)

## Parallel coordinates plot
## -------------------------

plot(subrules2, method="paracoord")
plot(subrules2, method="paracoord", control = list(reorder=TRUE))

## Doubledecker plot 
## -----------------

## Note: only works for a single rule
oneRule <- sample(rules, 1)
inspect(oneRule)
plot(oneRule, method="doubledecker", data = Groceries)

## Itemsets
## --------

itemsets <- eclat(Groceries, parameter = list(support = 0.02, minlen=2))
plot(itemsets)
plot(itemsets, method="graph")
plot(itemsets, method="paracoord", alpha=.5, reorder=TRUE)

## Add more quality measures to use for the scatterplot
## ----------------------------------------------------

quality(itemsets) <- interestMeasure(itemsets, trans=Groceries)
head(quality(itemsets))
plot(itemsets, measure=c("support", "allConfidence"), shading="lift")

## Save HTML widget as web page
## ----------------------------
## Not run: 
##D p <- plot(rules, engine = "html")
##D htmlwidgets::saveWidget(p, "arules.html", selfcontained = FALSE)
##D browseURL("arules.html")
## End(Not run)
# Note: selfcontained seems to make the browser slow.



