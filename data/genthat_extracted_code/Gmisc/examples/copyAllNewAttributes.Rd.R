library(Gmisc)


### Name: copyAllNewAttributes
### Title: A simple thing to keep the attributes
### Aliases: copyAllNewAttributes

### ** Examples

a <- "test"
attr(a, 'wow') <- 1000
b <- a
b <- copyAllNewAttributes(a, b)
print(attr(b, 'wow'))




