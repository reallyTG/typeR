library(container)


### Name: Deque
### Title: Deque (double-ended queue)
### Aliases: Deque
### Keywords: datasets

### ** Examples

# addleft
d <- Deque$new(1L)$addleft(2)
d$values()                                          # 2 1
Deque$new(0L)$addleft(3:1)$values()                 # 3 2 1 0

# count
Deque$new(c("Lisa", "Bob", "Bob"))$count("Bob")     # 2

# peek and pop
d <- Deque$new(1:3)
d$peek()                # 3
d$pop()                 # 3
d$pop()                 # 2
d$pop()                 # 1
#' \dontrun{
#' d$pop()              # Error: pop at empty Deque
#' }

Deque$new(1:3)$reverse()$values()   # 3 2 1

Deque$new(1:3)$rotate()$values()    # 3 1 2
Deque$new(1:3)$rotate(2)$values()   # 2 3 1
Deque$new(1:3)$rotate(-1)$values()  # 2 3 1



