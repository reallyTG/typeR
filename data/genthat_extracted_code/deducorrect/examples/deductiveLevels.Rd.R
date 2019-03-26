library(deducorrect)


### Name: deductiveLevels
### Title: Derive imputation values for categorical data
### Aliases: deductiveLevels

### ** Examples


# a simple example. We know the subject is pregnant. What is the gender?
E <- editarray(c(
    "gender %in% c('male','female')",
    "pregnant %in% c(TRUE,FALSE)",
    "if ( gender=='male') !pregnant"))
# a record with unknown gender
x <- c(gender=NA,pregnant=TRUE)

# find imputations
(s <- deductiveLevels(E,x))

# imputation can be done as follows:
x[names(s)] <- s



# Here's an example from De Waal et al (2011) (ex. 9.3)
E <- editarray(c(
    "x1 %in% letters[1:4]",
    "x2 %in% letters[1:3]",
    "x3 %in% letters[1:3]",
    "x4 %in% letters[1:2]",
    "if (x2 == 'c'  & x3 != 'c' & x4 == 'a' ) FALSE",
    "if (x2 != 'a'  & x4 == 'b') FALSE",
    "if (x1 != 'c'  & x2 != 'b' & x3 != 'a') FALSE",
    "if (x1 == 'c'  & x3 != 'a' & x4 == 'a' ) FALSE"
))

x <- c(x1='c',x2='b',x3=NA,x4=NA)
(s <- deductiveLevels(E,x))

x[names(s)] <- s


# another example, partial imputation
y <- c(x1=NA,x2=NA,x3=NA,x4='b')
(s <- deductiveLevels(E,y))

y[names(s)] <- s






