library(lvec)


### Name: sort.lvec
### Title: Sort a lvec
### Aliases: sort.lvec

### ** Examples

x <- as_lvec(rnorm(10))
sort(x)

# Effect of clone
a <- as_lvec(rnorm(10))
b <- sort(a, clone = FALSE)
print(a)




