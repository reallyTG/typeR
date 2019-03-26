library(miscset)


### Name: duplicates
### Title: Determine Duplicates
### Aliases: duplicates duplicatei duplicatei

### ** Examples

#

x <- c(7, 7, 7, 2, 3, 2)
data.frame(
  data = x,
  duplicated = duplicated(x),
  duplicates = duplicates(x),
  duplicatei = duplicatei(x),
  duplicatei0 = duplicatei(x, FALSE))

#



