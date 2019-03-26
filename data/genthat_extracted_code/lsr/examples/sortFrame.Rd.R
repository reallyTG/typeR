library(lsr)


### Name: sortFrame
### Title: Sort a data frame
### Aliases: sortFrame

### ** Examples
# first, create a data frame to be sorted...
txt <- c("bob","Clare","clare","bob","eve","eve")
num1 <- c(3,1,2,0,0,2)
num2 <- c(1,1,3,0,3,2)
etc <- c("not","used","as","a","sort","term")
dataset <- data.frame( txt, num1, num2, etc, stringsAsFactors=FALSE )
#       txt num1 num2  etc
#   1   bob    3    1  not
#   2 Clare    1    1 used
#   3 clare    2    3   as
#   4   bob    0    0    a
#   5   eve    0    3 sort
#   6   eve    2    2 term

#### Sorting by numeric variables ####

# Simplest use of the function is to sort the data frame by a single
# numeric variable, with the results to be returned in increasing 
# order, and ties to be kept in their original order:

sortFrame( dataset, num1 )
#       txt num1 num2  etc
#   4   bob    0    0    a
#   5   eve    0    3 sort
#   2 Clare    1    1 used
#   3 clare    2    3   as
#   6   eve    2    2 term
#   1   bob    3    1  not

# Specifying a second sort term will break ties using the second 
# term. For instance, we can sort by 'num1' (ascending order), 
# breaking ties by 'num2' (ascending order):

sortFrame( dataset, num1, num2 )
#       txt num1 num2  etc
#   4   bob    0    0    a
#   5   eve    0    3 sort
#   2 Clare    1    1 used
#   6   eve    2    2 term
#   3 clare    2    3   as
#   1   bob    3    1  not

# Specifying negative numbers sorts in descending order. For 
# instance, to sort by 'num1' in descending order, but break
# ties by 'num2' in ascending order, use the following:

sortFrame( dataset, -num1, num2 )
#       txt num1 num2  etc
#   1   bob    3    1  not
#   6   eve    2    2 term
#   3 clare    2    3   as
#   2 Clare    1    1 used
#   4   bob    0    0    a
#   5   eve    0    3 sort


#### Sorting by character variables ####

# When sorting by character variables (but not factors - see
# below), the default is to sort alphabetically, with upper
# case preceding lowr case. For example:

sortFrame( dataset, txt )
#       txt num1 num2  etc
#   1   bob    3    1  not
#   4   bob    0    0    a
#   2 Clare    1    1 used
#   3 clare    2    3   as
#   5   eve    0    3 sort
#   6   eve    2    2 term

# Sorting into reverse alphabetical order is possible using
# minus signs. For example:

sortFrame( dataset, -txt )
#       txt num1 num2  etc
#   5   eve    0    3 sort
#   6   eve    2    2 term
#   3 clare    2    3   as
#   2 Clare    1    1 used
#   1   bob    3    1  not
#   4   bob    0    0    a	


#### Other examples #####

# If alphabetical order is not desired for character variables
# it is possible to force sortFrame to use the default 'ASCII'
# ordering, in which all upper case letters precede all lower 
# case ones, by specifying alphabetical = FALSE, as follows:
 
sortFrame( dataset, txt, alphabetical = FALSE )
#       txt num1 num2  etc
#   2 Clare    1    1 used
#   1   bob    3    1  not
#   4   bob    0    0    a
#   3 clare    2    3   as
#   5   eve    0    3 sort
#   6   eve    2    2 term

# Note that factors are treated differently to character vectors. 
# They are not sorted alphabetically: instead they are sorted in 
# factor level order. For example, if we construct a data frame in
# which 'txt' is a factor, the results follow the order of the levels

dataset2 <- dataset
dataset2$txt <- factor( dataset2$txt, levels = c('bob','eve','clare','Clare'))

sortFrame( dataset2, txt )
#       txt num1 num2  etc
#   1   bob    3    1  not
#   4   bob    0    0    a
#   5   eve    0    3 sort
#   6   eve    2    2 term
#   3 clare    2    3   as
#   2 Clare    1    1 used

# Sorting by functions of multible variables is also possible.
# Note that this functionality is intended to be applied to numeric 
# variables only. It does work for non-numeric variables because of 
# the internal reliance on the xtfrm function, but the results may
# be unexpected. 

sortFrame( dataset, num1+num2 )
#       txt num1 num2  etc
#   4   bob    0    0    a
#   2 Clare    1    1 used
#   5   eve    0    3 sort
#   1   bob    3    1  not
#   6   eve    2    2 term
#   3 clare    2    3   as


# An example of a nonsensical application of mathematical operations 
# when sorting by character vector. It works, since the character 
# vector is treated as a numeric equivalent internally, but the 
# output does not make a great deal of sense:

sortFrame( dataset, (txt-3)^2 )
#       txt num1 num2  etc
#   2 Clare    1    1 used
#   3 clare    2    3   as
#   1   bob    3    1  not
#   4   bob    0    0    a
#   5   eve    0    3 sort
#   6   eve    2    2 term

# An example where sorting by text processing operations fails because 
# the xtfrm function converts it to a numerical vector before the text 
# processing operation is applied:

sortFrame( dataset, nchar(txt) )
#       txt num1 num2  etc
#   1   bob    3    1  not
#   2 Clare    1    1 used
#   3 clare    2    3   as
#   4   bob    0    0    a
#   5   eve    0    3 sort
#   6   eve    2    2 term

# ... no sorting has occurred here. Future releases may allow "as is" 
# terms to be included, which would allow something along the following 
# lines: sortFrame( dataset, nchar(I(txt)) ), and would produce the 
# desired output where the longer strings are sorted to the bottom of the
# data frame. However, no such functionality currently exists. 





