library(deducorrect)


### Name: imputess
### Title: Impute values from solution space
### Aliases: imputess

### ** Examples


#############################################
# IMPUTATION OF NUMERIC DATA
#############################################

# These examples are taken from De Waal et al (2011) (Examples 9.1-9.2)
E <- editmatrix(c(
    "x1 + x2      == x3",
    "x2           == x4",
    "x5 + x6 + x7 == x8",
    "x3 + x8      == x9",
    "x9 - x10     == x11",
    "x6 >= 0",
    "x7 >= 0"
))


dat <- data.frame(
    x1=c(145,145),
    x2=c(NA,NA),
    x3=c(155,155),
    x4=c(NA,NA),
    x5=c(NA, 86),
    x6=c(NA,NA),
    x7=c(NA,NA),
    x8=c(86,86),
    x9=c(NA,NA),
    x10=c(217,217),
    x11=c(NA,NA)
)

dat

d <- deduImpute(E,dat)
d$corrected
d$status
d$corrections




#############################################
# IMPUTATION OF CATEGORICAL DATA
#############################################


# Here's an example from Katrika (2001) [but see De Waal et al (2011), ex. 9.3)]
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


dat <- data.frame(
    x1 = c('c', NA ),
    x2 = c('b', NA ),
    x3 = c(NA , NA ),
    x4 = c(NA , 'b'),
    stringsAsFactors=FALSE)


s <- deduImpute(E,dat)
s$corrected
s$status
s$corrections


E <- editset(expression(
    x + y == z,
    x >= 0,
    A %in% c('a','b'),
    B %in% c('c','d'),
    if ( A == 'a' ) B == 'b',
    if ( B == 'b' ) x > 0
))

x <- data.frame(
    x = NA,
    y = 1,
    z = 1,
    A = 'a',
    B = NA
)
# deduImpute will impute x=0 and B='b',which violates the 
# last edit. Hence, imputation will be reverted.
deduImpute(E,x) 





