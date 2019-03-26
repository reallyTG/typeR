library(monographaR)


### Name: examinedSpecimens
### Title: Generates an examined specimens list
### Aliases: examinedSpecimens

### ** Examples


## loading the example data

data(monographaR_examples)
monographaR_examples$examinedSpecimens -> data
head(data)

## running the function, it will print in the terminal the output. 
## To export a txt, place a name in the filename argument
## (i.e., filename = "myoutput.txt")

examinedSpecimens(data, filename = "")




