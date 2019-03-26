library(Lahman)


### Name: PitchingPost
### Title: PitchingPost table
### Aliases: PitchingPost
### Keywords: datasets

### ** Examples

library("dplyr")
library(ggplot2)

# Restrict data to World Series in modern era
ws <- PitchingPost %>%
         filter(yearID >= 1903 & round == "WS")
# Pitchers with ERA 0.00 in WS play (> 10 IP)
ws %>%
  filter(IPouts > 30 & ERA == 0.00) %>%
  arrange(desc(IPouts)) %>%
  select(playerID, yearID, teamID, lgID, IPouts, W, L, G, 
         CG, SHO, H, R, SO, BFP) 

# Pitchers with the most IP in a series 
# 1903 Series went eight games - for details, see
# https://en.wikipedia.org/wiki/1903_World_Series
ws %>%
  arrange(desc(IPouts)) %>%
  select(playerID, yearID, teamID, lgID, IPouts, W, L, G, 
         CG, SHO, H, SO, BFP, ERA) %>%
  head(., 10)

# Pitchers with highest strikeout rate in WS
# (minimum 20 IP)
ws %>%
  filter(IPouts >= 60) %>%
  mutate(K_rate = 27 * SO/IPouts) %>%
  arrange(desc(K_rate)) %>%
  select(playerID, yearID, teamID, lgID, IPouts, 
         H, SO, K_rate) %>%
  head(., 10)
  
# Pitchers with the most IP in WS history
ws %>%
  group_by(playerID) %>%
  summarise_at(vars(IPouts, H, ER, CG, BB, SO, W, L), 
               sum, na.rm = TRUE) %>%
  mutate(ERA = round(27 * ER/IPouts, 2),
         Kper9 = round(27 * SO/IPouts, 3),
         WHIP = round(3 * (H + BB)/IPouts, 3)) %>%
  arrange(desc(IPouts)) %>%
  select(-H, -ER) %>%
  head(., 10)

# Plot of K/9 by year
ws %>%
  group_by(yearID) %>%
  summarise(Kper9 = 27 * sum(SO)/sum(IPouts)) %>%
  ggplot(., aes(x = yearID, y = Kper9)) +
    geom_point() +
    geom_smooth() +
    labs(x = "Year", y = "K per 9 innings")




