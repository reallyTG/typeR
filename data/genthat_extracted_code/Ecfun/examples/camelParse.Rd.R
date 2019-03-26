library(Ecfun)


### Name: camelParse
### Title: Split a character string where a capital letter follows a
###   lowercase letter
### Aliases: camelParse
### Keywords: manip

### ** Examples

tst <- c('Smith, JohnJohn Smith',
         'EducationNational DefenseOther Committee',
         'McCain, JohnJohn McCain')
tst. <- camelParse(tst)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst., list(c('Smith, John', 'John Smith'),
    c('Education', 'National Defense', 'Other Committee'),
    c('McCain, John', 'John McCain') ) )
## Don't show: 
)
## End(Don't show)



