library(Hmisc)


### Name: sedit
### Title: Character String Editing and Miscellaneous Character Handling
###   Functions
### Aliases: sedit substring.location substring2 substring2<-
###   replace.substring.wild numeric.string all.digits
### Keywords: manip character

### ** Examples

x <- 'this string'
substring2(x, 3, 4) <- 'IS'
x
substring2(x, 7) <- ''
x


substring.location('abcdefgabc', 'ab')
substring.location('abcdefgabc', 'ab', restrict=c(3,999))


replace.substring.wild('this is a cat','this*cat','that*dog')
replace.substring.wild('there is a cat','is a*', 'is not a*')
replace.substring.wild('this is a cat','is a*', 'Z')


qualify <- function(x) x==' 1.5 ' | x==' 2.5 '
replace.substring.wild('He won 1.5 million $','won*million',
                       'lost*million', test=qualify)
replace.substring.wild('He won 1 million $','won*million',
                       'lost*million', test=qualify)
replace.substring.wild('He won 1.2 million $','won*million',
                       'lost*million', test=numeric.string)


x <- c('a = b','c < d','hello')
sedit(x, c('=','he*o'),c('==','he*'))


sedit('x23', '*$', '[*]', test=numeric.string)
sedit('23xx', '^*', 'Y_{*} ', test=all.digits)


replace.substring.wild("abcdefabcdef", "d*f", "xy")


x <- "abcd"
substring2(x, "bc") <- "BCX"
x
substring2(x, "B*d") <- "B*D"
x



