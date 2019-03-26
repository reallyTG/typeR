library(lsr)


### Name: importList
### Title: Import a list
### Aliases: importList

### ** Examples
# data set organised into two groups
data <- c(1,2,3,4,5)
group <- c("group A","group A","group B","group B","group B")

# the split function creates a list with two elements
# named "group A" and "group B", each containing the 
# data for the respective groups
data.list <- split( data, group )

# The data.list variable looks like this:

#   $`group A`
#   [1] 1 2
#
#   $`group B`
#   [1] 3 4 5

# importing the list with the default value of ask = TRUE will
# cause R to wait on the user's approval. Typing this:

#   importList( data.list )

# would produce the following output:

#   Names of variables to be created:
#   [1] "group.A" "group.B"
#   Create these variables? [y/n] 

# If the user then types y, the new variables are created.

# this version will silently import the variables.
importList( x = data.list, ask = FALSE )




