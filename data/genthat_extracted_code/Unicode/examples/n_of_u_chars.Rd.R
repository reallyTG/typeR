library(Unicode)


### Name: n_of_u_chars
### Title: Unicode Character Counts
### Aliases: n_of_u_chars

### ** Examples

## How many code points are assigned to the Latin and Cyrillic scripts?
x <- u_scripts(c("Latn", "Cyrl"))
## Numbers in the respective ranges:
n <- lapply(x, n_of_u_chars)
n
## Total number:
sapply(n, sum)



