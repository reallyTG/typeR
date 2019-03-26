library(votesys)


### Name: cdc_dodgson
### Title: Dodgson Method
### Aliases: cdc_dodgson

### ** Examples

raw <- list2ballot(
    x = list(
        c('A', 'B', 'C', 'D', 'E', 'F'), 
        c('F', 'A', 'B', 'C', 'D', 'E'),
        c('E', 'D', 'C', 'B', 'F', 'A'),
        c('B', 'A', 'C', 'D', 'E', 'F'),
        c('F', 'E', 'D', 'C', 'B', 'A'),
        c('F', 'B', 'A', 'C', 'D', 'E'),
        c('E', 'D', 'C', 'A', 'F', 'B'),
        c('E', 'B', 'A', 'C', 'D', 'F'),
        c('F', 'D', 'C', 'A', 'E', 'B'),
        c('D', 'B', 'A', 'C', 'E', 'F'),
        c('F', 'E', 'C', 'A', 'D', 'B')
    ), 
    n = c(19, 12, 12, 9, 9, 10, 10 , 10 , 10, 10, 10)
)
vote <- create_vote(raw, xtype = 3, candidate = c('A', 'B', 'C', 'D', 'E', 'F'))
win1 <- cdc_simple(vote) # no winner
win2 <- cdc_dodgson(vote, dq_t = "dq") # A
win2 <- cdc_dodgson(win1, dq_t = "dq") # A
win3 <- cdc_dodgson(vote, dq_t = "t") # B
win3 <- cdc_dodgson(win2, dq_t = "t") # B



