library(Hmisc)


### Name: Lag
### Title: Lag a Numeric, Character, or Factor Vector
### Aliases: Lag
### Keywords: manip

### ** Examples

Lag(1:5,2)
Lag(letters[1:4],2)
Lag(factor(letters[1:4]),-2)
# Find which observations are the first for a given subject
id <- c('a','a','b','b','b','c')
id != Lag(id)
!duplicated(id)



