library(FinancialInstrument)


### Name: format_id
### Title: format an id
### Aliases: format_id

### ** Examples

format_id('U1', format='MMMYY', parse='suffix')
format_id('ES_JUN2011', format='CYY', parse='id')
format_id("SPY_20110826P129","opt2")
#several at once
id3 <- c('VX_aug1','ES_U1', 'VX_U11')
format_id(id3,'MMMYY')
format_id(id3,'CYY')
format_id(id3,'CY',sep="")



