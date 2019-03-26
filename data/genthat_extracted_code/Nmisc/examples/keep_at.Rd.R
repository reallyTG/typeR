library(Nmisc)


### Name: keep_at
### Title: Keep or discard elements
### Aliases: keep_at discard_at

### ** Examples

x <- c("First" = 1, "Second" = 2, "Last" = 3)
keep_at(x, "Second")
keep_at(x, Second)
keep_at(x, 2)
keep_at(x, starts_with("Sec"))
#> Second 
#>      2

keep_at(x, ends_with("t"))
#> First  Last 
#>     1     3

x <- c(1, 2, 3)
discard_at(x, 1)
#> Second   Last 
#>      2      3




