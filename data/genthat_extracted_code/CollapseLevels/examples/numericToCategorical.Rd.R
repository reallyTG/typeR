library(CollapseLevels)


### Name: numericToCategorical
### Title: numericToCategorical
### Aliases: numericToCategorical

### ** Examples


# Load the German_Credit data set supplied with this package

data("German_Credit")

# Create an empty list

l<-list()

# Call the function as follows.
#This will categorize the numeric variable Duration in the German_Credit dataset.

l<-numericToCategorical(German_Credit,col="Duration",resp="Good_Bad")


# To view the categorized variable

 l$categoricalVariable

 # To view the IV table of the levels of the categorized variable

 l$IVTable

 # To view the total IV value of the  categorized variable

 l$IV

 # To view the response rates of the levels of the categorized variable

 l$collapseLevels




