library(mosaicData)


### Name: Births2015
### Title: US Births in 2015
### Aliases: Births2015

### ** Examples

data(Births2015)
if (require(ggformula)) {
  gf_point(births ~ date, data = Births2015)
  gf_point(births ~ date, data = Births2015, color = ~ wday)
}
if (require(dplyr)) {
  Births78 %>% 
    group_by(wday) %>% summarise(births = sum(births)) %>% 
    ungroup() %>% mutate(frac = births / sum(births))
  Births2015 %>% 
    group_by(wday) %>% summarise(births = sum(births)) %>% 
    ungroup() %>% mutate(frac = births / sum(births))
}



