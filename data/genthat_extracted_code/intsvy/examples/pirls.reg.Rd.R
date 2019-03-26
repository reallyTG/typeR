library(intsvy)


### Name: pirls.reg
### Title: Regression analysis
### Aliases: pirls.reg pirls2016.reg

### ** Examples

## Not run: 
##D 
##D # Exhibit 3.13 in User Guide 2006, p. 68
##D 
##D # Recode ASBGBOOK
##D table(as.numeric(pirls$ASBGBOOK), pirls$ASBGBOOK)
##D pirls$BOOK[as.numeric(pirls$ASBGBOOK)==1] <- 5
##D pirls$BOOK[as.numeric(pirls$ASBGBOOK)==2] <- 18
##D pirls$BOOK[as.numeric(pirls$ASBGBOOK)==3] <- 63
##D pirls$BOOK[as.numeric(pirls$ASBGBOOK)==4] <- 151
##D pirls$BOOK[as.numeric(pirls$ASBGBOOK)==5] <- 251
##D table(pirls$BOOK)
##D 
##D pirls.reg(y= "BOOK", x= "ITSEX", by="IDCNTRYL", data=pirls)
## End(Not run)



