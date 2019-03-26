library(compare)


### Name: questionComments
### Title: Define a Commenting Scheme
### Aliases: questionComments comments transformComment
### Keywords: utilities logic

### ** Examples

# Comment a comparison involving several objects
# Start with a comment of 1 and deduct 1 if the comparison failed
questionComments(c("id", "age", "edu", "class"),
                 comments("class",
                          transformComment("coerced",
                                           "'class' is a factor!")))



