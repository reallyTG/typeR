library(Smisc)


### Name: parseJob
### Title: Parses a collection of elements into (almost) equal-sized groups
### Aliases: parseJob

### ** Examples

x <- parseJob(29, 6)
print(x)

# To see the range of each group
lapply(x, range)

# To see the length of each group
lengths(x)

# Randomize the outcome
parseJob(32, 5, random.seed = 231)

# Example of 'text.to.eval = TRUE'
out <- parseJob(11, 3, text.to.eval = TRUE)
out
lapply(out, function(x) eval(parse(text = x)))

# Example of 'collate = TRUE' and 'text.to.eval = TRUE'
parseJob(11, 3, collate = TRUE)
parseJob(11, 3, collate = TRUE, text.to.eval = TRUE)



