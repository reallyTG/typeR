library(radiant.model)


### Name: sensitivity.dtree
### Title: Evaluate sensitivity of the decision tree
### Aliases: sensitivity.dtree

### ** Examples

dtree(movie_contract, opt = "max") %>% 
  sensitivity(
    vars = "legal fees 0 100000 10000", 
    decs = c("Sign with Movie Company", "Sign with TV Network"), 
    custom = FALSE
  )




