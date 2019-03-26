library(glmmTMB)


### Name: addForm
### Title: Combine right-hand sides of an arbitrary number of formulas
### Aliases: addForm splitForm noSpecials
### Keywords: internal

### ** Examples

splitForm(~x+y)                     ## no specials or RE
splitForm(~x+y+(f|g))               ## no specials
splitForm(~x+y+diag(f|g))           ## one special
splitForm(~x+y+(diag(f|g)))         ## 'hidden' special
splitForm(~x+y+(f|g)+cs(1|g))       ## combination
splitForm(~x+y+(1|f/g))             ## 'slash'; term
splitForm(~x+y+(1|f/g/h))             ## 'slash'; term
splitForm(~x+y+(1|(f/g)/h))             ## 'slash'; term
splitForm(~x+y+(f|g)+cs(1|g)+cs(a|b,stuff))  ## complex special
splitForm(~(((x+y))))               ## lots of parentheses

noSpecials(y~1+us(1|f))
noSpecials(y~1+us(1|f),delete=FALSE)
noSpecials(y~us(1|f))
noSpecials(y~us+1)  ## should *not* delete unless head of a function



