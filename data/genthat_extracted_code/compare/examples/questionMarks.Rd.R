library(compare)


### Name: questionMarks
### Title: Define a Marking Scheme
### Aliases: questionMarks rule transformRule
### Keywords: utilities logic

### ** Examples

# Check a comparison involving an object called 'IndianMothers'
# Start with a mark of 1 and deduct 1 if the comparison failed
questionMarks("IndianMothers",
              maxMark=1,
              rule("IndianMothers", 1))

# Check comparisons involving several objects
# Start with a mark of 2, for each unsuccessful comparison
# deduct 1 mark, and if a comparison involving the object
# 'class' includes a coercion transformation, deduct 1 mark.
questionMarks(c("id", "age", "edu", "class"),
              maxMark=2,
              rule("id", 1),
              rule("age", 1),
              rule("edu", 1),
              rule("class", 1,
                   transformRule("coerced", 1)))



