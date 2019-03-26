library(rmonad)


### Name: rmonad
### Title: rmonad: handling pipes, errors, and everything with monads
### Aliases: rmonad rmonad-package

### ** Examples


# chain operations
cars %>>% colSums

# chain operations with intermediate storing
cars %v>% colSums

# handle failing monad
iris %>>% colSums %|>% head
cars %>>% colSums %|>% head

# run an effect
cars %>_% plot %>>% colSums

# return first successful operation
read.csv("a.csv") %||% iris %>>% head

# join two independent pipelines, preserving history
cars %>>% colSums %__% cars %>>% lapply(sd) %>>% unlist

# load an expression into a monad, catching errors
as_monad(stop("instant death"))

# convert multiple expressions into a list inside a monad
funnel(stop("oh no"), runif(5), sqrt(-1))



