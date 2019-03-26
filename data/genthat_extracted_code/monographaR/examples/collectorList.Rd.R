library(monographaR)


### Name: collectorList
### Title: Generates a collector list
### Aliases: collectorList

### ** Examples


## loading the example data

data(monographaR_examples)
monographaR_examples$collectorList -> data
head(data)

## running the function, it will print in the terminal the output. 
## To export a txt, place a ## name in the filename argument
## (i.e., filename = "myoutput.txt")

collectorList(data, filename = "", paragraphs = TRUE)

## or a second option

collectorList(data, filename = "", paragraphs = FALSE)





