library(SciViews)


### Name: enum
### Title: Enumerate items in an object.
### Aliases: enum

### ** Examples

enum(letters)
enum(numeric(0))
# Compare with:
1:length(numeric(0))
enum(NULL)
letters5 <- letters[1:5]
for (i in enum(letters5)) cat("letter", i, "=", letters5[i], "\n")



