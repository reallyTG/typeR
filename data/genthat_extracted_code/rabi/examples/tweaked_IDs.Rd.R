library(rabi)


### Name: tweaked_IDs
### Title: Brute force color coding scheme generator
### Aliases: tweaked_IDs

### ** Examples

alphabet <- 8      # the number of colors or symbols we have
total.length <- 5  # the number of positions we want mark
redundancy <- 2    # how many marks we can lose but still ID perfectly

  #Create a function for determining odd or even
 odd <- function(x){ x %% 2 == 1 }

  #Create a matrix of all possible sequences
perms <- rep(list(seq_len(alphabet)),total.length)
combos <- as.matrix(expand.grid(perms)) - 1
  #Only keep sequences that fit our constraints.
  #We want the first position to only be odd numbers
  #and the second position to only be even.
combos <- combos[which(odd(combos[,1]) & !odd(combos[,2])), ]
codes <- tweaked_IDs(combos, redundancy, num.tries = 1)

print(paste0("The 'tweaked' list contains ", length(codes), " unique IDs."))




