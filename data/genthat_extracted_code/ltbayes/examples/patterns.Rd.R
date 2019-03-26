library(ltbayes)


### Name: patterns
### Title: Response Patterns for Given Total Score(s)
### Aliases: patterns

### ** Examples

# response patterns for five binary items that
# yield a total score of 3

y <- patterns(5, 2, 3)

# response patterns for 3 5-category items that
# yield a total score of at least 3

y <- patterns(3, 5, c(3:12))



