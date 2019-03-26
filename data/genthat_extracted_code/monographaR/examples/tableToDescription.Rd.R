library(monographaR)


### Name: tableToDescription
### Title: Generates species descriptions
### Aliases: tableToDescription

### ** Examples


## loading the example data

data(monographaR_examples)
monographaR_examples$tableToDescription -> data
head(data)

## the first column is just an identifier for the characters, we need to 
## remove it before running the analysis

data[,-1] -> data

## running the function, it will print in the terminal the output. 
## To export a txt, place a name in the filename argument 
## (i.e., filename = "myoutput.txt")

tableToDescription(data, filename = "")




