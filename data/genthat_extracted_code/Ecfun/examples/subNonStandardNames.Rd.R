library(Ecfun)


### Name: subNonStandardNames
### Title: sub for nonstandard names
### Aliases: subNonStandardNames
### Keywords: manip

### ** Examples

##
## 1.  Example 
##
tstSNSN <- c('Raul', 'Ra`l', 'Torres,Raul', 'Torres, Ra`l',
           "Robert C. \\Bobby\\\\", 'Ed  \n --Vacancy', '', '  ')
#  confusion in character sets can create
#  names like Names[2]
##
## 2.  subNonStandardNames(vector)
##
SNS2 <- subNonStandardNames(tstSNSN)
SNS2

# check 
SNS2. <- c('Raul', 'Raul', 'Torres,Raul', 'Torres, Raul',
            'Robert C. "Bobby"', 'Ed', '', '')
attr(SNS2., 'secondLine') <- c(rep(NA, 5), ' --Vacancy', NA, NA)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(SNS2, SNS2.)
## Don't show: 
)
## End(Don't show)
##
## 3.  subNonStandardNames(matrix)
##
tstmat <- parseName(tstSNSN, surnameFirst=TRUE)
submat <- subNonStandardNames(tstmat)

# check 
SNSmat <- parseName(SNS2., surnameFirst=TRUE)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(submat, SNSmat)
## Don't show: 
)
## End(Don't show)

##
## 4.  subNonStandardNames(data.frame)
##
tstdf <- as.data.frame(tstmat)
subdf <- subNonStandardNames(tstdf)

# check 
SNSdf <- as.data.frame(SNSmat, stringsAsFactors=FALSE)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(subdf, SNSdf)
## Don't show: 
)
## End(Don't show)

##
## 5.  namesNotFound 
##
noSub <- subNonStandardNames('xx_x')

# check 
noSub. <- 'xx_x'
attr(noSub., 'namesNotFound') <- 'xx_x'
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(noSub, noSub.)
## Don't show: 
)
## End(Don't show)



