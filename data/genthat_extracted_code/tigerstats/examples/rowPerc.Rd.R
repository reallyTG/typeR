library(tigerstats)


### Name: rowPerc
### Title: Row Percents
### Aliases: rowPerc

### ** Examples

data(ledgejump)
MyTable <- xtabs(~weather+crowd.behavior,data=ledgejump)
rowPerc(MyTable)



