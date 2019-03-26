library(pedquant)


### Name: md_stock_symbol
### Title: symbol components of exchange or index
### Aliases: md_stock_symbol

### ** Examples

## No test: 
# get stock symbols in a stock exchange
## specify the name of exchange
ex_syb1 = md_stock_symbol(exchange = c('sse', 'szse'))

## choose stock exchanges interactivly
ex_syb2 = md_stock_symbol()


# get stock components of a stock index (only in sse and szse)
index_syb = md_stock_symbol(index = c('000001', '000016', '000300', '000905'))

## End(No test)




