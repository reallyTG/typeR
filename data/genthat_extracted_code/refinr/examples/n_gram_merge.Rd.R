library(refinr)


### Name: n_gram_merge
### Title: Value merging based on ngram fingerprints
### Aliases: n_gram_merge

### ** Examples

x <- c("Acme Pizza, Inc.", "ACME PIZA COMPANY", "Acme Pizzazza LLC")

n_gram_merge(vect = x)

# The performance of the approximate string matching can be ajusted using
# parameters 'weight' or 'edit_threshold'
n_gram_merge(vect = x,
             weight = c(d = 0.4, i = 1, s = 1, t = 1))

# Use parameter 'ignore_strings' to ignore specific strings during merging
# of values.
x <- c("Bakersfield Highschool", "BAKERSFIELD high",
       "high school, bakersfield")
n_gram_merge(vect = x, ignore_strings = c("high", "school", "highschool"))




