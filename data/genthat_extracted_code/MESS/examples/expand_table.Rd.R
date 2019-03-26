library(MESS)


### Name: expand_table
### Title: Expand table or matrix to data frame
### Aliases: expand_table
### Keywords: manip

### ** Examples


expand_table(diag(3))
m <- matrix(c(2, 1, 3, 0, 0, 2), 3)
expand_table(m)
result <- expand_table(UCBAdmissions)
head(result)

# Combine into table again
xtabs(~Admit + Gender + Dept, data=result)




