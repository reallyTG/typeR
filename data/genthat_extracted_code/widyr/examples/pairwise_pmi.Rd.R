library(widyr)


### Name: pairwise_pmi
### Title: Pointwise mutual information of pairs of items
### Aliases: pairwise_pmi pairwise_pmi_

### ** Examples


library(dplyr)

dat <- data_frame(group = rep(1:5, each = 2),
                  letter = c("a", "b",
                             "a", "c",
                             "a", "c",
                             "b", "e",
                             "b", "f"))

# how informative is each letter about each other letter
pairwise_pmi(dat, letter, group)
pairwise_pmi(dat, letter, group, sort = TRUE)




