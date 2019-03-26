library(Ecfun)


### Name: subNonStandardCharacters
### Title: sub nonstandard characters with replacement
### Aliases: subNonStandardCharacters
### Keywords: manip

### ** Examples

##
## 1. Consider Names = Ruben, Avila and Jose, where "e" and "A" in
##    these examples carry an accent.  With the default values
##    for standardCharacters and replacement, these might be 
##    converted to something like Rub_n, _vila, and Jos_, with 
##    different software possibly mangling the names differently.  
##    (The standard checks for R packages in an English locale 
##    complains about non-ASCII characters, because they are 
##    not portable.)
##
nonstdNames <- c('Ra`l', 'Ra`', '`l', 'Torres, Raul',
           "Robert C. \\Bobby\\\\", NA, '', '  ', 
           '$12', '12%')
#  confusion in character sets can create
#  names like Names[2]
Name2 <- subNonStandardCharacters(nonstdNames)
str(Name2)

# check 
Name2. <- c('Ra_l', 'Ra_', '_l', nonstdNames[4],
            'Robert C. "Bobby"', NA, '', '  ', 
            '$12', '12%')
str(Name2.)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(Name2, Name2.)
## Don't show: 
)
## End(Don't show)
##
## 2.  Example from iconv
##
icx <- c("Ekstr\xf8m", "J\xf6reskog", 
         "bi\xdfchen Z\xfcrcher")
icx2 <- subNonStandardCharacters(icx)

# check 
icx. <- c('Ekstrom', 'Joreskog', 'bisschen Zurcher')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(icx2, icx.)
## Don't show: 
)
## End(Don't show)




