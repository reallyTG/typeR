library(purrr)


### Name: lmap
### Title: Apply a function to list-elements of a list
### Aliases: lmap lmap_if lmap_at

### ** Examples

# Let's write a function that returns a larger list or an empty list
# depending on some condition. This function also uses the names
# metadata available in the attributes of the list-element
maybe_rep <- function(x) {
  n <- rpois(1, 2)
  out <- rep_len(x, n)
  if (length(out) > 0) {
    names(out) <- paste0(names(x), seq_len(n))
  }
  out
}

# The output size varies each time we map f()
x <- list(a = 1:4, b = letters[5:7], c = 8:9, d = letters[10])
x %>% lmap(maybe_rep)

# We can apply f() on a selected subset of x
x %>% lmap_at(c("a", "d"), maybe_rep)

# Or only where a condition is satisfied
x %>% lmap_if(is.character, maybe_rep)


# A more realistic example would be a function that takes discrete
# variables in a dataset and turns them into disjunctive tables, a
# form that is amenable to fitting some types of models.

# A disjunctive table contains only 0 and 1 but has as many columns
# as unique values in the original variable. Ideally, we want to
# combine the names of each level with the name of the discrete
# variable in order to identify them. Given these requirements, it
# makes sense to have a function that takes a data frame of size 1
# and returns a data frame of variable size.
disjoin <- function(x, sep = "_") {
  name <- names(x)
  x <- as.factor(x[[1]])

  out <- lapply(levels(x), function(level) {
    as.numeric(x == level)
  })

  names(out) <- paste(name, levels(x), sep = sep)
  out
}

# Now, we are ready to map disjoin() on each categorical variable of a
# data frame:
iris %>% lmap_if(is.factor, disjoin)
mtcars %>% lmap_at(c("cyl", "vs", "am"), disjoin)



