library(WordPools)


### Name: Battig
### Title: Battig - Montague Categorized Word Norms
### Aliases: Battig
### Keywords: datasets

### ** Examples

data(Battig)
## maybe str(Battig) ; plot(Battig) ...

# select items from several categories
cats <- c("fish", "bird", "flower", "tree")
for (c in cats) {
	cat("\nCategory:", c, "\n")	
	print(pickList(subset(Battig, catname==c), nitems=5))
}

# or, using sapply():
sapply(cats, function(c) pickList(subset(Battig, catname==c), nitems=5), simplify=FALSE)



