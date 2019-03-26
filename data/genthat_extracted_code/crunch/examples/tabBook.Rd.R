library(crunch)


### Name: tabBook
### Title: Compute a Tab Book
### Aliases: tabBook

### ** Examples

## Not run: 
##D m <- newMultitable(~ gender + age4 + marstat, data=ds)
##D tabBook(m, ds[ds$income > 1000000,], format="xlsx", file="wealthy-tab-book.xlsx")
##D book <- tabBook(m, ds) # Returns a TabBookResult
##D tables <- prop.table(book, 2)
## End(Not run)



