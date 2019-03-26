library(sos)


### Name: sortFindFn
### Title: Sort a findFn Object
### Aliases: sortFindFn
### Keywords: methods print

### ** Examples

tstdf <- data.frame(Package=letters[c(1,1,2)],
                    Function=c('a1', 'a2', 'b3'), Score=2:4,
                    Date=11:13, Description=c('D1', 'D2', 'D3'),
                    Link=c('L1', 'L2', 'L3'), stringsAsFactors=FALSE)
rss <- sortFindFn(tstdf)



