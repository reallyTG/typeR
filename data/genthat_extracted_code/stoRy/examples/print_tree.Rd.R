library(stoRy)


### Name: print_tree
### Title: Theme hierarchy tree view.
### Aliases: print_tree

### ** Examples

########################################################################
# Display the "the human condition" theme hierarchy in tree format     #
########################################################################
theme_name <- "the human condition"
mytheme <- theme$new(theme_name)
print_tree(mytheme, pruneMethod = "dist", limit = 50)



