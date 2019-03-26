library(MultinomialCI)


### Name: multinomialCI
### Title: Simultaneous confidence intervals for multinomial proportions
###   (Sison-Graz method)
### Aliases: multinomialCI
### Keywords: multinomial confidence interval estimation

### ** Examples

# Multinomial distribution with 3 classes, from which 79 samples 
# were drawn: 23 of them belong to the first class, 12 to the 
# second class and 44 to the third class. Punctual estimations 
# of the probabilities from this sample would be 23/79, 12/79 
# and 44/79 but we want to build 95% simultaneous confidence intervals 
# for the true probabilities

m = multinomialCI(c(23,12,44), 0.05);
print(paste("First class: [", m[1,1], m[1,2], "]"));
print(paste("Second class: [", m[2,1], m[2,2], "]"));
print(paste("Third class: [", m[3,1], m[3,2], "]"));



