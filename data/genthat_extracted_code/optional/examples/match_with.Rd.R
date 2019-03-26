library(optional)


### Name: match_with
### Title: Match With
### Aliases: match_with

### ** Examples

library(magrittr)

a <- 5
match_with(a,
  . %>% option(.),     paste,
  none, function()   "Error!"
)
## [1] 5

match_with(a,
  1,                   function()  "Matched exact value",
  list(2, 3, 4),       function(x) paste("Matched in list:", x),
  . %>% if (. > 4) .,  function(x) paste("Matched in condition:", x)
)
## [1] "Matched in condition: 5"



