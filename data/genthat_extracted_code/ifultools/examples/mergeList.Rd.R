library(ifultools)


### Name: mergeList
### Title: Merges the information from two lists
### Aliases: mergeList
### Keywords: list

### ** Examples

## develop lists 
dinner <- list(Entree="Spaghetti and Meatballs",
    Starter="Caesar Salad", Dessert="Spumoni",
    Beverage="Wine and Water")

## oops, we are all out of spumoni and we just got 
## some tiramisu in from the local bakery 
change <- list(Dessert="Tiramisu",Note="Please tip your waiter")

## merge the lists and prett-print 
prettyPrintList(mergeList(dinner, change), header="What's for dinner?")



