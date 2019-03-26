library(container)


### Name: Iterator
### Title: Iterator
### Aliases: Iterator
### Keywords: datasets

### ** Examples

# Iterator on primitive list
it <- Iterator$new(list("A", 1, 2))
while(it$has_next()) {
    print(it$get_next())
}
it$has_next()   # FALSE

# Iterator from Container object
d <- Deque$new(1:3)
it <- d$iter()
sum <- 0
while(it$has_next()) {
sum <- sum + it$get_next()
}
print(sum)



