## ----knitr-setup, include = FALSE----------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----out.width = '40%', echo = FALSE, fig.cap="Class diagram with basic class hierarchy."----
knitr::include_graphics("class-diagram-bare.png")

## ----lib-setup-----------------------------------------------------------
library(container)

## ------------------------------------------------------------------------
collection <-  Container$new()
collection$empty()

## ------------------------------------------------------------------------
collection$add(1)
collection$add("A")
collection$add(data.frame(B=1, C=2))
collection$type()

## ------------------------------------------------------------------------
collection$values()

## ------------------------------------------------------------------------
collection$print()  # alternatively: print(collection)

## ------------------------------------------------------------------------
ints <- Container$new(integer())
ints$type()

## ------------------------------------------------------------------------
ints$add(1)$add(2)$add(3.7)$print()

## ------------------------------------------------------------------------
ints <- Container$new(1:10)$print()

ints$values()

ints$size()

## ------------------------------------------------------------------------
ints$has(11)

ints$has(7)

ints$discard(7)$has(7)

ints$remove(8)$has(8)

## ------------------------------------------------------------------------
tryCatch(ints$remove(8), error = function(e) e$message)

## ------------------------------------------------------------------------
ints$discard(8) # ok

## ------------------------------------------------------------------------
ints$add(1:3)$values()

ints$discard(1)$values()

ints$discard(2, right=TRUE)$values()

## ------------------------------------------------------------------------
unlist(ints$apply(f = function(x) x^2))

ints$clear()$empty()

## ------------------------------------------------------------------------
members <- Container$new(c("Lisa", "Bob", "Joe"))$print()

remove_Joe <- function(cont) cont$discard("Joe")
remove_Joe(members)
members

## ------------------------------------------------------------------------
it <- members$iter()
while(it$has_next()) print(it$get_next())

## ------------------------------------------------------------------------
tryCatch(it$get_next(), error = function(e) e$message)

## ------------------------------------------------------------------------
d <- Deque$new(0L)
d$type()
d

## ------------------------------------------------------------------------
d$add(1)$add(2)$addleft(1)$addleft(2)$values()

d$count(0)  # count number of 0s

d$count(1)  # count number of 1s

## ------------------------------------------------------------------------
d$peek()

d$pop()

d$pop()

d$values()

## ------------------------------------------------------------------------
d$peekleft()

d$popleft()

d$values()

d$count(2)

## ------------------------------------------------------------------------
Deque$new()$peek()

tryCatch(Deque$new()$pop(), error = function(e) e$message)

## ------------------------------------------------------------------------
d$add(rep(0, 3))$values()

d$rotate()$values()    # rotate 1 to the right

d$rotate(2)$values()   # rotate 2 to the right

d$rotate(-3)$values()  # rotate 3 to the left

d$addleft(4:2)$values()

d$reverse()$values()

## ------------------------------------------------------------------------
d2 <- Deque$new(integer())
it <- d$iter()
while(it$has_next()) {
    d2$add(it$get_next())
    if (it$has_next()) d2$addleft(it$get_next())
}
d2$values()

## ------------------------------------------------------------------------
s1 <- Set$new(1:3)$print()

s1$add(1)  # does not change the set 
s1

## ------------------------------------------------------------------------
s1 <- Set$new(c(1, 2,    4, 5))
s2 <- Set$new(c(   2, 3,    5, 6))

s1$union(s2)$print()

s1$intersect(s2)$print()

s1$diff(s2)$print()

s1$is.subset(s2)
s1$is.subset(s1$union(s2))
s1$intersect(s2)$is.subset(s1)

s1$is.equal(s2)
s1$is.equal(s1)

s1$is.superset(s2)
s1$union(s2)$is.superset(s2)

## ------------------------------------------------------------------------
ages <- Dict$new(c(Peter=24, Lisa=23, Bob=32))$print()

ages$add("Albert", 139)$values()

tryCatch(ages$add("Bob", 40), error = function(e) e$message)

ages$has("Peter")

ages$discard("Albert")$values()

# Trying to discard a non-existing key has no effect
ages$discard("Albert")$values()

# Trying to remove a non-existing key throws an error
tryCatch(ages$remove("Albert"), error = function(e) e$message)

## ------------------------------------------------------------------------
ages$keys()

ages$peek("Lisa")

ages$peek("Anna")

## ------------------------------------------------------------------------
tryCatch(ages$set("Anna"), error = function(e) e$message)

ages$set("Anna", 23, add=TRUE)  # alternatively ages$add("Anna", 23)
ages

## ------------------------------------------------------------------------
ages$set("Lisa", 11)$values()

## ------------------------------------------------------------------------
ages$pop("Lisa")

ages$values()

tryCatch(ages$pop("Lisa"), error = function(e) e$message)

tryCatch(ages$get("Lisa"), error = function(e) e$message)

ages$peek("Lisa")

## ------------------------------------------------------------------------
set.seed(123)
while(!ages$empty()) {
    print(ages$popitem())
}

