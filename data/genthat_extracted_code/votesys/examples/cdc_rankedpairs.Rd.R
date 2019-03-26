library(votesys)


### Name: cdc_rankedpairs
### Title: Ranked Pairs Method
### Aliases: cdc_rankedpairs

### ** Examples

raw <- rbind(c('m', 'n', 'c', 'k'), c('n', 'c', 'k', 'm'), 
    c('c', 'k', 'n', 'm'), c('k', 'c', 'n', 'm')) 
raw <- list2ballot(m = raw, n = c(42, 26, 15, 17))
vote <- create_vote(raw, xtype = 2, candidate = c('m', 'n', 'c', 'k'))
y <- cdc_rankedpairs(vote)



