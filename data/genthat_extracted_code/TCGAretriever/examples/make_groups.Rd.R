library(TCGAretriever)


### Name: make_groups
### Title: Split Numeric Vectors in Groups
### Aliases: make_groups

### ** Examples

exprs_geneX <- c(19.1,18.4,22.4,15.5,20.2,17.4,9.4,12.4,31.2,33.2,18.4,22.1)
groups_num <- 3
groups_labels <- c("high", "med", "low")
make_groups(exprs_geneX, groups_num, groups_labels, desc = TRUE)



