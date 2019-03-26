library(bdscale)


### Name: bd2t
### Title: Transform 'Date's into your business-date scale.
### Aliases: bd2t

### ** Examples

monday <- as.Date('2014-10-13')
weekdays <- monday + 0:4
bd2t(monday + c(1, 3), weekdays)




