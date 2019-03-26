library(votesys)


### Name: cdc_schulze
### Title: Schulze Method
### Aliases: cdc_schulze

### ** Examples

raw <- list2ballot(
    x = list(
        c('a', 'c', 'b', 'e', 'd'), 
        c('a', 'd', 'e', 'c', 'b'), 
        c('b', 'e', 'd', 'a', 'c'), 
        c('c', 'a', 'b', 'e', 'd'), 
        c('c', 'a', 'e', 'b', 'd'), 
        c('c', 'b', 'a', 'd', 'e'), 
        c('d', 'c', 'e', 'b', 'a'), 
        c('e', 'b', 'a', 'd', 'c')
    ), 
    n = c(5, 5, 8, 3, 7, 2, 7, 8)
)
vote <- create_vote(raw, xtype = 3, candidate = c('a', 'b', 'c', 'd', 'e'))
win1 <- cdc_simple(vote) # no winner
win2 <- cdc_schulze(vote) # winner is e
win2 <- cdc_schulze(win1)



