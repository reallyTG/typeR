library(inferr)


### Name: infer_mcnemar_test
### Title: McNemar Test
### Aliases: infer_mcnemar_test mcnemar_test

### ** Examples

# using variables from data
library(dplyr)
hb <- mutate(hsb,
        himath = if_else(math > 60, 1, 0),
        hiread = if_else(read > 60, 1, 0)
    )
infer_mcnemar_test(hb, himath, hiread)

# test if the proportion of students in himath and hiread group is same
himath <- ifelse(hsb$math > 60, 1, 0)
hiread <- ifelse(hsb$read > 60, 1, 0)
infer_mcnemar_test(table(himath, hiread))

# using matrix
infer_mcnemar_test(matrix(c(135, 18, 21, 26), nrow = 2))



