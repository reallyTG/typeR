library(corpus)


### Name: term_matrix
### Title: Term Frequency Tabulation
### Aliases: term_counts term_matrix

### ** Examples

text <- c("A rose is a rose is a rose.",
          "A Rose is red, a violet is blue!",
          "A rose by any other name would smell as sweet.")
term_matrix(text)

# select certain terms
term_matrix(text, select = c("rose", "red", "violet", "sweet"))

# specify a grouping factor
term_matrix(text, group = c("Good", "Bad", "Good"))

# include higher-order n-grams
term_matrix(text, ngrams = 1:3)

# select certain multi-type terms
term_matrix(text, select = c("a rose", "a violet", "sweet", "smell"))

# transpose the result
term_matrix(text, ngrams = 1:2, transpose = TRUE)[1:10, ] # first 10 rows

# data frame
head(term_counts(text), n = 10) # first 10 rows

# with grouping
term_counts(text, group = c("Good", "Bad", "Good"))

# taking names from the input
term_counts(c(a = "One sentence.", b = "Another", c = "!!"))



