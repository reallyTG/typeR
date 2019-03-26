library(mefa)


### Name: mefaNestedless
### Title: Make Non-Nested 'mefa' Object
### Aliases: mefaNestedless
### Keywords: manip

### ** Examples

data(dol.count)
x <- mefa(stcs(dol.count), nested = TRUE)
x
y <- mefaNestedless(x)
y



