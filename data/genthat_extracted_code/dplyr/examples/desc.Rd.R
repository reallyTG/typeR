library(dplyr)


### Name: desc
### Title: Descending order
### Aliases: desc

### ** Examples

desc(1:10)
desc(factor(letters))

first_day <- seq(as.Date("1910/1/1"), as.Date("1920/1/1"), "years")
desc(first_day)

starwars %>% arrange(desc(mass))



