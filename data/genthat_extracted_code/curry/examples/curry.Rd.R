library(curry)


### Name: curry
### Title: Curry a function from the start
### Aliases: %<% curry

### ** Examples

# Equivalent to curry(`+`, 5)
add_5 <- `+` %<% 5
add_5(10)

# ellipsis are retained when currying
bind_5 <- cbind %<% 5
bind_5(1:10)




