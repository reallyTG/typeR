## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval= FALSE--------------------------------------------------------
#  install.packages("usfertilizer")

## ---- message=FALSE, warning=FALSE---------------------------------------
require(usfertilizer)
require(tidyverse)
data("us_fertilizer_county")

## ------------------------------------------------------------------------
glimpse(us_fertilizer_county)

## ------------------------------------------------------------------------
# plot the top 10 nitrogen application in year 2008.
# Reorder to make the plot more cleanner.
year_plot = 2008
us_fertilizer_county %>%
  filter(Nutrient == "N" & Year == year_plot & Input.Type == "Fertilizer" ) %>%
  top_n(10, Quantity) %>%
  ggplot(aes(x=reorder(paste(County,State, sep = ","), Quantity), Quantity, fill = Quantity))+
  scale_fill_gradient(low = "blue", high = "darkblue")+
  geom_col()+
  ggtitle(paste("Top 10 counties with most fertilizer application in the year of", year_plot)) + 
  scale_y_continuous(name = "Nitrogen from commecial fertilization (kg)")+
  scale_x_discrete(name = "Counties")+
  coord_flip()+
  theme_bw()

## ------------------------------------------------------------------------
# plot the top 10 states with P application in year 1980.
# Reorder to make the plot more cleanner.
year_plot = 1980
us_fertilizer_county %>%
  filter(Nutrient == "P" & Year == 1980 & Input.Type == "Fertilizer") %>% 
  group_by(State) %>% 
  summarise(p_application = sum(Quantity)) %>% 
  as.data.frame() %>% 
  top_n(10, p_application) %>%
  ggplot(aes(x=reorder(State, p_application), p_application))+
  scale_fill_gradient(low = "blue", high = "darkblue")+
  geom_col()+
  ggtitle(paste("Top 10 States with most Phosphrus application in the year of", year_plot)) + 
  scale_y_continuous(name = "Phosphrus from commecial fertilizer (kg)")+
  scale_x_discrete(name = "States")+
  theme_bw()+
  coord_flip()
  

## ---- message=F, warning=F-----------------------------------------------
year_plot = seq(1945, 2010, 1)
states = c("NC","SC")

us_fertilizer_county %>% 
  filter(State %in% states & Year %in% year_plot &
           Farm.Type == "farm" & Input.Type == "Fertilizer") %>% 
  group_by(State, Year, Nutrient) %>% 
  summarise(Quantity = sum(Quantity, na.rm = T)) %>% 
  ggplot(aes(x = as.numeric(Year), y = Quantity, color=State)) +
  geom_point() +
  geom_line()+
  scale_x_continuous(name = "Year")+
  scale_y_continuous(name = "Nutrient input quantity (kg)")+
  facet_wrap(~Nutrient, scales = "free", ncol = 2)+
  ggtitle("Estimated nutrient inputs into arable lands by commercial fertilizer\nfrom 1945 to 2010 in Carolinas")+
  theme_bw()


## ------------------------------------------------------------------------
us_fertilizer_county %>% 
  filter(State %in% states & Year %in% year_plot &
           Farm.Type == "farm" & Nutrient == "N") %>% 
  group_by(State, Year, Input.Type) %>% 
  summarise(Quantity = sum(Quantity, na.rm = T)) %>% 
  ggplot(aes(x = as.numeric(Year), y = Quantity, color=Input.Type)) +
  geom_point() +
  geom_line()+
  scale_x_continuous(name = "Year")+
  scale_y_continuous(name = "Nutrient input quantity (kg)")+
  facet_wrap(~State, scales = "free", ncol = 2)+
  ggtitle("Estimated nitrogen inputs into arable lands by commercial fertilizer and manure\nfrom 1945 to 2012 in Carolinas")+
  theme_bw()

