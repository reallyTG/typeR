library(fc)


### Name: fc
### Title: Generalized Function Composition and Partial Function Evaluation
### Aliases: fc

### ** Examples


# Partial function evaluation - a function that returns the first three
# elements of an object.
head3 <- fc(head, n=3)

# Function composition - a function that returns the fifth through the
# 10th element of an object using the head and tail functions.
head_1_to_10 <- fc(head, n=10)
head_5_to_10 <- fc(tail, x=head_1_to_10(x))
head_5_to_10(iris)



