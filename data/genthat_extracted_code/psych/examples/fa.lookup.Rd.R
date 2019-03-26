library(psych)


### Name: fa.lookup
### Title: A set of functions for factorial and empirical scale
###   construction
### Aliases: lookup fa.lookup item.lookup keys.lookup
### Keywords: models multivariate

### ** Examples

#Tne following shows how to create a dictionary
#first, copy the spreadsheet to the clipboard
# bfi.dictionary <- read.clipboard.tab()  #read from the clipboard
# rownames(bfi.dictionary) <- bfi.dictionary[1] #the first column had the names
# bfi.dictionary <- bfi.dictionary[-1]  #these are redundant, drop them

f5 <- fa(bfi,5)
m <- colMeans(bfi,na.rm=TRUE)
item.lookup(f5,m,dictionary=bfi.dictionary[2])
fa.lookup(f5,dictionary=bfi.dictionary[2])  #just show the item content, not the source of the items




