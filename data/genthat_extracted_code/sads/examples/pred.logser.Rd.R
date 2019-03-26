library(sads)


### Name: pred.logser
### Title: Predicted number of species by Fisher's Logseries
### Aliases: pred.logser

### ** Examples

data(moths) # Willians' moth data
pred.logser(1:5, J=sum(moths), S=length(moths)) #predicted
table(moths)[1:5] # observed 



