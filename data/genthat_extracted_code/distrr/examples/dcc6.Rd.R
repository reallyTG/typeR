library(distrr)


### Name: dcc6
### Title: Data cube creation
### Aliases: dcc6

### ** Examples

dcc6(invented_wages,
     .variables = c("gender", "sector"), 
     .funs_list = list(n = ~dplyr::n()),
     .all = TRUE)
     
dcc6(invented_wages,
     .variables = c("gender", "sector"), 
     .funs_list = list(n = ~dplyr::n()),
     .all = FALSE)




