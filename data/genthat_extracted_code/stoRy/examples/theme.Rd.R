library(stoRy)


### Name: theme
### Title: Theme objects
### Aliases: theme
### Keywords: datasets

### ** Examples

########################################################################
# Create a theme object for the theme "utopia" and print the result    #
########################################################################
theme_name <- "utopia"
mytheme <- theme$new(theme_name)
mytheme$print()

########################################################################
# Display the "utopia" theme and its descendent themes in tree format  #
########################################################################
print_tree(mytheme)

########################################################################
# Display the "society" theme hierarchy in tree format                 #
########################################################################
theme_name <- "society"
mytheme <- theme$new(theme_name)
print_tree(mytheme, pruneMethod = "dist", limit = 50)



