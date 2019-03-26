library(mosaicData)


### Name: Birthdays
### Title: US Births in 1969 - 1988
### Aliases: Birthdays

### ** Examples

data(Birthdays)
if (require(mosaic)) {
  MI <- Birthdays %>% filter(state == "MI")
  gf_point(births ~ date, Birthdays, data = MI) 
  gf_line(births ~ date, Birthdays, data = MI, color = ~ wday)
  gf_line(births ~ date, 
    data = Birthdays %>% group_by(date) %>% summarise(births = sum(births)))
  }



