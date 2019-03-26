library(Ecfun)


### Name: parseName
### Title: Parse surname and given name
### Aliases: parseName
### Keywords: manip

### ** Examples

##
## 1.  Parse standard first-last name format
##
tstParse <- c('Joe Smith (AL)', 'Teresa Angelica Sanchez de Gomez',
         'John Brown, Jr.', 'John Brown Jr.',
         'John W. Brown III', 'John Q. Brown,I',
         'Linda Rosa Smith-Johnson', 'Anastasio Somoza Debayle',
         'Ra_l Vel_zquez', 'Sting', 'Colette, ')
parsed <- parseName(tstParse)

tstParse2 <- matrix(c('Smith', 'Joe', 'Gomez', 'Teresa Angelica Sanchez de',
  'Brown', 'John, Jr.', 'Brown', 'John, Jr.',
  'Brown', 'John W., III', 'Brown', 'John Q., I',
  'Smith-Johnson', 'Linda Rosa', 'Debayle', 'Anastasio Somoza',
  'Velazquez', 'Raul', '', 'Sting', 'Colette', ''),
  ncol=2, byrow=TRUE)
# NOTE:  The 'Anastasio Somoza Debayle' is in the Spanish tradition
# and is handled incorrectly by the current algorithm.
# The correct answer should be "Somoza Debayle", "Anastasio".
# However, fixing that would complicate the algorithm excessively for now.
colnames(tstParse2) <- c("surname", 'givenName')

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(parsed, tstParse2)
## Don't show: 
)
## End(Don't show)

##
## 2.  Parse "surname, given name" format
##
tst3 <- c('Smith (AL),Joe', 'Sanchez de Gomez, Teresa Angelica',
     'Brown, John, Jr.', 'Brown, John W., III', 'Brown, John Q., I',
     'Smith-Johnson, Linda Rosa', 'Somoza Debayle, Anastasio',
     'Vel_zquez, Ra_l', ', Sting', 'Colette,')
tst4 <- parseName(tst3)

tst5 <- matrix(c('Smith', 'Joe', 'Sanchez de Gomez', 'Teresa Angelica',
  'Brown', 'John, Jr.', 'Brown', 'John W., III', 'Brown', 'John Q., I',
  'Smith-Johnson', 'Linda Rosa', 'Somoza Debayle', 'Anastasio',
  'Velazquez', 'Raul', '','Sting', 'Colette',''),
  ncol=2, byrow=TRUE)
colnames(tst5) <- c("surname", 'givenName')

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst4, tst5)
## Don't show: 
)
## End(Don't show)

##
## 3.  secondLine 
##
L2 <- parseName(c('Adam\n2nd line', 'Ed  \n --Vacancy', 'Frank'))

# check 
L2. <- matrix(c('', 'Adam', '', 'Ed', '', 'Frank'), 
              ncol=2, byrow=TRUE)
colnames(L2.) <- c('surname', 'givenName')
attr(L2., 'secondLine') <- c('2nd line', ' --Vacancy', NA)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(L2, L2.)
## Don't show: 
)
## End(Don't show)

##
## 4.  Force surnameFirst when in a minority 
##
snf <- c('Sting', 'Madonna', 'Smith, Al')
SNF <- parseName(snf, surnameFirst=TRUE)

# check 
SNF2 <- matrix(c('', 'Sting', '', 'Madonna', 'Smith', 'Al'), 
               ncol=2, byrow=TRUE)
colnames(SNF2) <- c('surname', 'givenName')               
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(SNF, SNF2)
## Don't show: 
)
## End(Don't show)

##
## 5.  nameNotFound
##
noSub <- parseName('xx_x')

# check 
noSub. <- matrix(c('', 'xx_x'), 1)
colnames(noSub.) <- c('surname', 'givenName')               
attr(noSub., 'namesNotFound') <- 'xx_x'
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(noSub, noSub.)
## Don't show: 
)
## End(Don't show)



