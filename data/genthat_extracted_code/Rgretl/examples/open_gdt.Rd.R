library(Rgretl)


### Name: open_gdt
### Title: opening _gretl_ and _gretl_-supported data files
### Aliases: open_gdt

### ** Examples

denmark = open_gdt("denmark.gdt")
head(denmark)
description(denmark)

## Not run: 
##D gold = open_gdt("http://www.principlesofeconometrics.com/poe4/data/stata/gold.dta")
##D description(gold)
## End(Not run)



