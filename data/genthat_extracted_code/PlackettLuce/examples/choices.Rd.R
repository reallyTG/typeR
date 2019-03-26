library(PlackettLuce)


### Name: choices
### Title: Choices Object
### Aliases: choices

### ** Examples

R <- matrix(c(1, 2, 0, 0,
              4, 1, 2, 3,
              2, 1, 1, 1,
              1, 2, 3, 0,
              2, 1, 1, 0,
              1, 0, 3, 2), nrow = 6, byrow = TRUE)
colnames(R) <- c("apple", "banana", "orange", "pear")
actual_choices <- choices(R, names = TRUE)
coded_choices <- choices(R, names = FALSE)
attr(coded_choices, "objects")

## Coercion to tibble is straightforwards
if (require(tibble)){
    as.tibble(coded_choices)
}



