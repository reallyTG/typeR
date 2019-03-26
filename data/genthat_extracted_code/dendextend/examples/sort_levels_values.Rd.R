library(dendextend)


### Name: sort_levels_values
### Title: Sort the values level in a vector
### Aliases: sort_levels_values

### ** Examples


x <- 1:4
sort_levels_values(x) # 1 2 3 4

x <- c(4:1)
names(x) <- letters[x]
attr(x, "keep_me") <- "a cat"
sort_levels_values(x) # 1 2 3 4

x <- c(4:1,4, 2)
sort_levels_values(x) # 1 2 3 4 1 3

x <- c(2,2,3,2,1)
sort_levels_values(x) # 1 1 2 1 3

x<- matrix(16:1, 4, 4)
rownames(x) <- letters[1:4]
x
apply(x, 2, sort_levels_values)




