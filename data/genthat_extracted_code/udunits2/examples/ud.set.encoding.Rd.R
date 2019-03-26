library(udunits2)


### Name: ud.set.encoding
### Title: Set the udunits package level encoding type
### Aliases: ud.set.encoding

### ** Examples

valid.enc.strings <- c('utf8', 'ascii', 'iso-8859-1', 'latin1')
lapply(valid.enc.strings, ud.set.encoding)
err <- try(ud.set.encoding("This will fail"))



