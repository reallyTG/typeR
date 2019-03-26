library(UsingR)


### Name: bright.stars
### Title: List of bright stars with Hipparcos catalog number
### Aliases: bright.stars
### Keywords: datasets

### ** Examples

data(bright.stars)
all.names  = paste(bright.stars$name, sep="", collapse="")
x = unlist(strsplit(tolower(all.names), ""))
letter.dist = sapply(letters, function(i) sum(x == i))
data(scrabble)			#  for frequency info
p = scrabble$frequency[1:26];p=p/sum(p)
chisq.test(letter.dist, p=p)	# compare with English



