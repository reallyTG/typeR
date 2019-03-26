library(eechidna)


### Name: nat_map16
### Title: Map of Australian Electorates from 2016
### Aliases: nat_map16
### Keywords: datasets

### ** Examples


library(eechidna)
data(nat_map16)
# choropleth map with Australian Census data
nat_map16$region <- nat_map16$elect_div
data(abs2016)
abs2016$region <- abs2016$DivisionNm
library(ggplot2)
library(ggthemes)
both <- intersect(unique(abs2016$region), unique(nat_map16$region))
ggplot(aes(map_id=region), data=subset(abs2016, region %in% both)) +
  geom_map(aes(fill=MedianPersonalIncome), map=subset(nat_map16, region %in% both)) +
  expand_limits(x=nat_map16$long, y=nat_map16$lat) + 
  theme_map()




