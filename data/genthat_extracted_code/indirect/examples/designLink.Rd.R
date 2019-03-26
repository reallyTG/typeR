library(indirect)


### Name: designLink
### Title: Create list with information for the elicitation session
### Aliases: designLink

### ** Examples

X <- matrix(c(1, 1, 0, 1), nrow = 2) # design
Z <- designLink(design = X, link = "logit", target = "target",
 CI.prob = 1/2, expertID = "Expert", facilitator = "facilitator")



