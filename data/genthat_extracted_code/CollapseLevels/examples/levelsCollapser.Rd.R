library(CollapseLevels)


### Name: levelsCollapser
### Title: levelsCollapser
### Aliases: levelsCollapser

### ** Examples


# Load the German_Credit data set supplied with this package

data("German_Credit")

# Create an empty list

l<-list()

# Call the function as follows

l<-levelsCollapser(German_Credit,resp="Good_Bad",bins=10)

# response rate by levels of the Account_Balance in the German_Credit data

l$Account_Balance

# Collapse levels with similar response percentages.




