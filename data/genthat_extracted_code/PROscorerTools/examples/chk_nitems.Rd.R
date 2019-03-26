library(PROscorerTools)


### Name: chk_nitems
### Title: Checks the number and values of items passed to custom scoring
###   functions
### Aliases: chk_nitems chkstop_nitems chk_values chkstop_values

### ** Examples

itemBad <- c(0, 1, 2, 3, 10)
itemGood <- c(0, 1, 2, 3, 0)
dfBad <- data.frame(itemBad, itemGood)
dfGood <- data.frame(itemGood, itemGood)
chk_nitems(dfBad, 1)
chk_nitems(dfGood, 2)
chk_values(dfBad, 0:3)
chk_values(dfGood, 0:3)




