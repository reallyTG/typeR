library(votesys)


### Name: dowdall_method
### Title: Dowdall Method
### Aliases: dowdall_method

### ** Examples

raw <- list2ballot(string = 
    c("51: a>c>b>d", "5: c>b>d>a", "23: b>c>d>a", "21: d>c>b>a")
)
vote <- create_vote(raw, xtype = 3, candidate = c("a", "b", "c", "d"))
y1 <- borda_method(vote) # winner is c
y2 <- dowdall_method(vote) # winner is a



