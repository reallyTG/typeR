library(fastR2)


### Name: Pigs
### Title: Pass the Pigs
### Aliases: Pigs
### Keywords: datasets

### ** Examples


data(Pigs)
tally( ~ black, data = Pigs )
if (require(tidyr)) {
  Pigs %>% 
  select(roll, black, pink) %>%
  gather(pig, state, black, pink) %>%
  tally( state ~ pig, data = ., format = "prop", margins = TRUE)
}
  




