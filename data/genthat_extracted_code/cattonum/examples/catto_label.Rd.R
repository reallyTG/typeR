library(cattonum)


### Name: catto_label
### Title: Label encoding
### Aliases: catto_label

### ** Examples

catto_label(iris)

y <- 2 ^ (0:5)
x1 <- c("a", "b", NA, "b", "a", "a")
x2 <- c("c", "c", "c", "d", "d", "c")
df_fact <- data.frame(y, x1, x2)

catto_label(df_fact,
            ordering = list(c("b", "a"), c("c", "d")))

catto_label(df_fact, ordering = c("increasing", "decreasing"))



