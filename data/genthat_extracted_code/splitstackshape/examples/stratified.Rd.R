library(splitstackshape)


### Name: stratified
### Title: Take a Stratified Sample From a Dataset
### Aliases: stratified

### ** Examples


# Generate a sample data.frame to play with
set.seed(1)
DF <- data.frame(
  ID = 1:100,
  A = sample(c("AA", "BB", "CC", "DD", "EE"), 100, replace = TRUE),
  B = rnorm(100), C = abs(round(rnorm(100), digits=1)),
  D = sample(c("CA", "NY", "TX"), 100, replace = TRUE),
  E = sample(c("M", "F"), 100, replace = TRUE))

# Take a 10% sample from all -A- groups in DF
stratified(DF, "A", .1)

# Take a 10% sample from only "AA" and "BB" groups from -A- in DF
stratified(DF, "A", .1, select = list(A = c("AA", "BB")))

# Take 5 samples from all -D- groups in DF, specified by column number
stratified(DF, group = 5, size = 5)

# Use a two-column strata: -E- and -D-
stratified(DF, c("E", "D"), size = .15)

# Use a two-column strata (-E- and -D-) but only use cases where -E- == "M"
stratified(DF, c("E", "D"), .15, select = list(E = "M"))

## As above, but where -E- == "M" and -D- == "CA" or "TX"
stratified(DF, c("E", "D"), .15, select = list(E = "M", D = c("CA", "TX")))

# Use a three-column strata: -E-, -D-, and -A-
stratified(DF, c("E", "D", "A"), size = 2)

## Not run: 
##D # The following will produce errors
##D stratified(DF, "D", c(5, 3))
##D stratified(DF, "D", c(5, 3, 2))
## End(Not run)

# Sizes using a named vector
stratified(DF, "D", c(CA = 5, NY = 3, TX = 2))

# Works with multiple groups as well
stratified(DF, c("D", "E"), 
           c("NY F" = 2, "NY M" = 3, "TX F" = 1, "TX M" = 1,
             "CA F" = 5, "CA M" = 1))




