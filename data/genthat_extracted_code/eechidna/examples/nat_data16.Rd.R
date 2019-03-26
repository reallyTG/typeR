library(eechidna)


### Name: nat_data16
### Title: Data of the Australian Electorates from 2016
### Aliases: nat_data16
### Keywords: datasets

### ** Examples


library(eechidna)
library(tidyverse)
library(ggthemes)
data(nat_map16)
data(fp16)
winners <- fp16 %>% filter(Elected == "Y")
data(nat_data16)
nat_data16$DivisionNm <- toupper(nat_data16$elect_div)
nat_data16 <- nat_data16 %>% left_join(winners, by = "DivisionNm")

# Plot
partycolours = c("#FF0033", "#000000", "#CC3300", "#0066CC", "#FFFF00", "#009900")

ggplot(data=nat_map16) + 
geom_polygon(aes(x=long, y=lat, group=group), fill="grey90", colour="white") +
geom_point(data=nat_data16, aes(x=x, y=y, colour=PartyNm), size=1.5, alpha=0.8) +
scale_colour_manual(name="Political Party", values=partycolours) +
theme_map() + coord_equal() + theme(legend.position="bottom")



