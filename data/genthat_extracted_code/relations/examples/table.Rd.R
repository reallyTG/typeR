library(relations)


### Name: table
### Title: Relation Table
### Aliases: relation_table
### Keywords: math

### ** Examples

R <- data.frame(Name = c("David", "John"),
                Age = c(33, 66),
                stringsAsFactors = FALSE)
R <- as.relation(R)
relation_table(R)



