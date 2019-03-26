library(votesys)


### Name: check_dup_wrong
### Title: Check Ballots with Duplicated Values, Mistakes, or without Any
###   Valid Entry
### Aliases: check_dup_wrong

### ** Examples

raw=list(
    c('a', 'e', 'c', 'd', 'b'), 
    c('b', 'a', 'e'), 
    c('c', 'd', 'b'), 
    c('d', 'a', 'b'), 
    c('a', 'a', 'b', 'b', 'b'), 
    c(NA, NA, NA, NA), 
    v7=NULL, 
    v8=c('a', NA, NA, NA, NA, NA, NA), 
    v9=rep(" ", 3)
)
y=check_dup_wrong(raw, xtype=3, candidate=letters[1: 5])
y=check_dup_wrong(raw, xtype=3, candidate=letters[1: 4]) 



