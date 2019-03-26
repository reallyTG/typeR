library(bfw)


### Name: AddNames
### Title: Add Names
### Aliases: AddNames

### ** Examples

par <- "cor[1,2]"
job.names <- c("A","B")
AddNames(par, job.names, keep.par = TRUE)
# [1]  "cor[1,2]: A vs. B"
AddNames(par, job.names, keep.par = FALSE)
# [1]  "A vs. B"
AddNames(par, job.names, names.only = TRUE)
# [1]  "A" "B"



