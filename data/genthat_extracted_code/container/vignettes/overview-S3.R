## ----knitr-setup, include = FALSE----------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----lib-setup-----------------------------------------------------------
library(container)

## ------------------------------------------------------------------------
collection <- container()
empty(collection)

## ------------------------------------------------------------------------
size(collection)

collection$size()

## ------------------------------------------------------------------------
add(collection, 1)
add(collection, "A")
add(collection, data.frame(B=1, C=2))
type(collection)

## ------------------------------------------------------------------------
values(collection)

## ------------------------------------------------------------------------
print(collection)

## ------------------------------------------------------------------------
ints <- container(integer())
type(ints)

## ------------------------------------------------------------------------
ints <- container(1:10)
print(ints)

values(ints)

size(ints)

## ------------------------------------------------------------------------
has(ints, 11)

has(ints, 7)

discard(ints, 7)
has(ints, 7)

remove(ints, 8)
values(ints)

## ---- error=TRUE---------------------------------------------------------
remove(ints, 8)

## ------------------------------------------------------------------------
discard(ints, 8) # ok

## ------------------------------------------------------------------------
values(add(ints, 1:3))

values(discard(ints, 1))

values(discard(ints, 2, right=TRUE))

## ------------------------------------------------------------------------
members <- print(container(c("Lisa", "Bob", "Joe")))

remove_Joe <- function(cont) discard(cont, "Joe")
remove_Joe(members)
members

## ------------------------------------------------------------------------
it <- iter(members)
print(it)

while(ithas_next(it)) {
    print(itget_next(it))
    print(it)
}

## ---- error=TRUE---------------------------------------------------------
itget_next(it)

## ------------------------------------------------------------------------
d <- deque(0L)
type(d)
d

## ------------------------------------------------------------------------
add(d, 1)
add(d, 2)
addleft(d, 1)
addleft(d, 2)
values(d)

count(d, 0)  # count number of 0s

count(d, 1)  # count number of 1s

## ------------------------------------------------------------------------
peek(d)

pop(d)

pop(d)

d

## ------------------------------------------------------------------------
peekleft(d)

popleft(d)

d

## ---- error=TRUE---------------------------------------------------------
peek(deque())

pop(deque())

## ------------------------------------------------------------------------
values(add(d, rep(0, 3)))

values(rotate(d))    # rotate 1 to the right

values(rotate(d, 2))   # rotate 2 to the right

values(rotate(d, -3))  # rotate 3 to the left

values(addleft(d, 4:2))

values(reverse(d))

## ------------------------------------------------------------------------
d

5:6 + d

d + 5:6

## ------------------------------------------------------------------------
reverse_ps <- function(x)
{
    it <- iter(seq_along(x))
    d <- deque(integer())
    
    while(ithas_next(it)) {
        itnext(it)
        d$add(itget(it))
        if (ithas_next(it)) d$addleft(itget_next(it))
    }
    x[values(d)]
}

(zz <- rep(c(0, 1), 10))

reverse_ps(zz)

## ------------------------------------------------------------------------
s1 <- set(1:3)
s1

add(s1, 1)  # does not change the set 
s1

## ------------------------------------------------------------------------
s1 <- set(c(1, 2,    4, 5))
s2 <- set(c(   2, 3,    5, 6))

s1 + s2

s1 / s2

s1 - s2

s1 < s2

s1 < (s1 + s2)

(s1 / s2) < s1

s1 == s2

s1 == s1

s1 > s2

(s1 + s2) > s2

## ------------------------------------------------------------------------
(ages <- dict(c(Peter=24, Lisa=23, Bob=32)))

keys(ages)

peek(ages, "Lisa")

peek(ages, "Anna")

## ---- error=TRUE---------------------------------------------------------
values(add(ages, "Albert", 139))

add(ages, "Bob", 40)

has(ages, "Peter")

values(discard(ages, "Albert"))

# Trying to discard a non-existing key has no effect ...
discard(ages, "Albert")

# ... but trying to remove a non-existing key throws an error
remove(ages, "Albert")

## ---- error=TRUE---------------------------------------------------------
setval(ages, "Anna", 23)
#ages[["Anna"]] <- 23             

setval(ages, "Anna", 23, add=TRUE)  # alternatively: add(ages, "Anna", 23)
#ages[["Anna", add=TRUE]] <- 23
ages

## ------------------------------------------------------------------------
setval(ages, "Lisa", 11)
#ages[["Lisa"]] <- 11

values(ages)

## ---- error=TRUE---------------------------------------------------------
pop(ages, "Lisa")

values(ages)

pop(ages, "Lisa")

getval(ages, "Lisa")

peek(ages, "Lisa")

## ------------------------------------------------------------------------
set.seed(123)
while(!ages$empty()) print(ages$popitem())

## ------------------------------------------------------------------------
shoplist <- dict(list(eggs=10, potatoes=10, bananas=5, apples=4))

shoplist2 <- dict(list(eggs=6, broccoli=4))

unlist(values(update(shoplist, shoplist2)))

## ---- error=TRUE---------------------------------------------------------
d <- dict()
d["A"] <- 1             # add(d, "A", 1)

d

d["A"] <- 2             # add(d, "A", 2)

d[["A"]] <- 2           # setval(d, "A", 2)

d[["B"]] <- 3           # setval(d, "A", 3)

d[["B", add=T]] <- 3    # setval(d, "A", 3, add=T)

d

d["A"]                  # peek(d, "A")

d[["C"]]                # getval(d, "C")

d["C"]                  # peek(d, "C")

## ------------------------------------------------------------------------
other <- dict(list(B=7, C=10))
d + other

d - other

## ------------------------------------------------------------------------
(co <- as.container(1:3))

as.vector(co)

as.list(co)

df <- data.frame(A=1:3, B=3:1)

d <- as.dict(df)
d

as.data.frame(d)

