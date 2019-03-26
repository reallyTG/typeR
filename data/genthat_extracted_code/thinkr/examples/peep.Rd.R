library(thinkr)


### Name: peep
### Title: peep the pipeline
### Aliases: peep

### ** Examples

if( require(magrittr) ){
  # just symbols
  iris %>% peep(head,tail) %>% summary
  # expressions with .
  iris %>% peep(head(., n=2),tail(., n=3) ) %>% summary
  # or both
  iris %>% peep(head,tail(., n=3) ) %>% summary
  # use verbose to see what happens
  iris %>% peep(head,tail(., n=3), verbose = TRUE) %>% summary
}



