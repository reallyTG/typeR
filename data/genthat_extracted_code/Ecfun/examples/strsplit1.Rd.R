library(Ecfun)


### Name: strsplit1
### Title: Split the first field
### Aliases: strsplit1
### Keywords: manip

### ** Examples

chars2split <- c(qs00='abcdefg', qs01='abc,def', 
   qs10a='"abcdefg', qs10b='abc"defg', 
   qs1.1='"abc,def', qs20='"abc" def', 
   qs2.1='"ab,c" def', qs21='"abc", def', qs22.1='"a,b",c')    

split <- strsplit1(chars2split)

# answer
split. <- list(c(qs00='abcdefg', qs01='abc', qs10a='"abcdefg', 
   qs10b='abc"defg', qs1.1='"abc,def', qs20='"abc" def', 
   qs2.1='"ab,c" def', qs21='"abc"', qs22.1='"a,b"'), 
               c(qs00='', qs01='def', qs10a='', 
   qs10b='', qs1.1='', qs20='', qs2.1='', 
   qs21=' def', qs22.1='c') )
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(split, split.)
## Don't show: 
)
## End(Don't show)



