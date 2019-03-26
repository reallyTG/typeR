library(nycflights13)


### Name: airports
### Title: Airport metadata
### Aliases: airports
### Keywords: datasets

### ** Examples

if (require("dplyr")) {
airports

airports %>% mutate(dest = faa) %>% semi_join(flights)
flights %>% anti_join(airports %>% mutate(dest = faa))
airports %>% mutate(origin = faa) %>% semi_join(flights)

}



