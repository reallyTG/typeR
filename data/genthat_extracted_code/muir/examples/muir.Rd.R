library(muir)


### Name: muir
### Title: Explore Datasets with Trees
### Aliases: muir

### ** Examples

## Not run: 
##D # Load in the 'mtcars' dataset
##D data(mtcars)
##D 
##D # Basic exploration - show all values
##D mtTree <- muir(data = mtcars, node.levels = c("cyl:*", "carb:*"))
##D mtTree
##D 
##D # Basic exploration - show all values overriding default node.limit
##D mtTree <- muir(data = mtcars, node.levels = c("cyl:*", "carb:*"), node.limit = 5)
##D mtTree
##D 
##D # Show all values overriding default node.limit differently for each column
##D mtTree <- muir(data = mtcars, node.levels = c("cyl:2", "carb:5"))
##D mtTree
##D 
##D # Show all values overriding default node.limit for each column
##D # and aggregating all distinct values above the node.limit into a
##D # separate "Other" column to collect remaining values
##D 
##D # Top 2 occurring 'carb' values will be returned in their own nodes,
##D # remaining values/counts will be aggregated into a separate "Other" node
##D mtTree <- muir(data = mtcars, node.levels = c("cyl:2", "carb:2+"))
##D mtTree
##D 
##D # Add additional calculations to each node output (dplyr::summarise functions)
##D mtTree <- muir(data = mtcars, node.levels = c("cyl:2", "carb:2+"),
##D label.vals = c("min(wt)", "max(wt)"))
##D mtTree
##D 
##D # Make new label values more reader-friendly
##D mtTree <- muir(data = mtcars, node.levels = c("cyl:2", "carb:2+"),
##D label.vals = c("min(wt):Min Weight", "max(wt):Max Weight"))
##D mtTree
##D 
##D # Instead of just returning top counts for columns provided in \code{node.levels},
##D # provide custom filter criteria and custom node titles in \code{label.vals}
##D # (criteria could also be read in from a csv file as a data.frame)
##D criteria <- data.frame(col = c("cyl", "cyl", "carb"),
##D oper = c("<", ">=", "=="),
##D val = c(4, 4, 2),
##D title = c("Less Than 4 Cylinders", "4 or More Cylinders", "2 Carburetors"))
##D 
##D mtTree <- muir(data = mtcars, node.levels = c("cyl", "carb"),
##D level.criteria = criteria,
##D label.vals = c("min(wt):Min Weight", "max(wt):Max Weight"))
##D mtTree
##D 
##D # Use same criteria but show all other values for the column where NOT
##D # EQUAL to the combination of the filters provided for that column (e.g., for cyl
##D # where !(cyl < 4 | cyl >= 4) in an "Other" node
##D mtTree <- muir(data = mtcars, node.levels = c("cyl:+", "carb:+"),
##D level.criteria = criteria,
##D label.vals = c("min(wt):Min Weight", "max(wt):Max Weight"))
##D mtTree
##D 
##D # Show empty child nodes (balanced tree)
##D mtTree <- muir(data = mtcars, node.levels = c("cyl:+", "carb:+"),
##D level.criteria = criteria,
##D label.vals = c("min(wt):Min Weight", "max(wt):Max Weight"),
##D show.empty.child = TRUE)
##D mtTree
##D 
##D # Save tree to HTML file with \code{htmlwidgets} package to working directory
##D mtTree <- muir(data = mtcars, node.levels = c("cyl:2", "carb:2+"))
##D htmlwidgets::saveWidget(mtTree, "mtTree.html")
## End(Not run)



