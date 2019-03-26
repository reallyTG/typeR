library(CUFF)


### Name: strutils
### Title: Utility functions to treat characters
### Aliases: %+%-methods %+% %n% paste numtostr
### Keywords: paste char character

### ** Examples

require(CUFF)
"Hello " %+% "world."
cat(" " %n%  c(rep(1,9),2) %+% 1:10,fill=TRUE)
### Returns a * because specified length of character is unsufficient. 
numtostr(9048948449.94948,nch=8)




