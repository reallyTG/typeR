library(Ecfun)


### Name: grepNonStandardCharacters
### Title: grep for nonstandard characters
### Aliases: grepNonStandardCharacters
### Keywords: manip

### ** Examples

Names <- c('Raul', 'Ra`l', 'Torres,Raul', 'Torres, Raul')
#  confusion in character sets can create
#  names like Names[2]

chk <- grepNonStandardCharacters(Names)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(chk, 2)
## Don't show: 
)
## End(Don't show)

chkv <- grepNonStandardCharacters(Names, TRUE)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(chkv, 'Ra`l')
## Don't show: 
)
## End(Don't show)




