library(psychReport)


### Name: createDF
### Title: createDF
### Aliases: createDF

### ** Examples

library(psychReport)
# Example 1:
dat <- createDF()

# Example 2:
dat <- createDF(nVP = 50, nTrl = 50,
                design = list("Comp" = c("comp", "incomp")))

# Example 3:
dat <- createDF(nVP = 50, nTrl = 50,
                design = list("Comp" = c("comp", "incomp"),
                              "Side" = c("left", "right")))




