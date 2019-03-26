library(naniar)


### Name: all-is-miss-complete
### Title: Identify if all values are missing or complete
### Aliases: all-is-miss-complete all_na all_miss all_complete

### ** Examples


misses <- c(NA, NA, NA)
complete <- c(1, 2, 3)
mixture <- c(NA, 1, NA)

all_na(misses)
all_na(complete)
all_na(mixture)
all_complete(misses)
all_complete(complete)
all_complete(mixture)




