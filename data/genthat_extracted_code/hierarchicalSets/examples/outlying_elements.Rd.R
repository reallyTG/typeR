library(hierarchicalSets)


### Name: outlying_elements
### Title: Extract the outlying elements from each set pair
### Aliases: outlying_elements

### ** Examples

data('twitter')

twitSet <- create_hierarchy(twitter)

# Just get the counts
countOut <- outlying_elements(twitSet)
head(countOut)

# Or the actual elements
elemOut <- outlying_elements(twitSet, FALSE)
head(elemOut)




