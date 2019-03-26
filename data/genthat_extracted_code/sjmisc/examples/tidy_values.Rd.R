library(sjmisc)


### Name: tidy_values
### Title: Tidy values of character vectors.
### Aliases: tidy_values

### ** Examples

f1 <- sprintf("Char %s", sample(LETTERS[1:5], size = 10, replace = TRUE))
f2 <- as.factor(sprintf("F / %s", sample(letters[1:5], size = 10, replace = TRUE)))
f3 <- sample(1:5, size = 10, replace = TRUE)

x <- data.frame(f1, f2, f3, stringsAsFactors = FALSE)

tidy_values(f1)
tidy_values(f2)
tidy_values(x)




