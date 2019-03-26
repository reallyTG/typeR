library(strex)


### Name: str_match_arg
### Title: Argument Matching.
### Aliases: str_match_arg match_arg

### ** Examples

choices <- c("Apples", "Pears", "Bananas", "Oranges")
match_arg(NULL, choices)
match_arg("A", choices)
match_arg("B", choices, index = TRUE)
match_arg(c("a", "b"), choices, several_ok = TRUE, ignore_case = TRUE)
match_arg(c("b", "a"), choices, ignore_case = TRUE, index = TRUE,
          several_ok = TRUE)




