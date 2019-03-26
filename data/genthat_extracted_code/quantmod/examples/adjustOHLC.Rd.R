library(quantmod)


### Name: adjustOHLC
### Title: Adjust Open,High,Low,Close Prices For Splits and Dividends
### Aliases: adjustOHLC
### Keywords: misc

### ** Examples

## Not run: 
##D getSymbols("AAPL", from="1990-01-01", src="yahoo")
##D head(AAPL)
##D head(AAPL.a <- adjustOHLC(AAPL))
##D head(AAPL.uA <- adjustOHLC(AAPL, use.Adjusted=TRUE))
##D 
##D # intraday adjustments are precise across all methods
##D # an example with Open to Close (OpCl)
##D head(cbind(OpCl(AAPL),OpCl(AAPL.a),OpCl(AAPL.uA)))
##D 
##D # Close to Close changes may lose precision
##D head(cbind(ClCl(AAPL),ClCl(AAPL.a),ClCl(AAPL.uA)))
## End(Not run)



