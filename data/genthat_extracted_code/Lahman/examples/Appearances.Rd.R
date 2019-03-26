library(Lahman)


### Name: Appearances
### Title: Appearances table
### Aliases: Appearances
### Keywords: datasets

### ** Examples

data(Appearances)
library("dplyr")
library("tidyr")

# Henry Aaron's last two years as a DH in Milwaukee
Appearances %>%
   filter(playerID == "aaronha01" & teamID == "ML4") %>%
   select(yearID:G_batting, G_of:G_ph)  # subset variables
   
# Herb Washington, strictly a pinch runner for Oakland in 1974-5
Appearances %>%
   filter(playerID == "washihe01") 

# A true utility player - Jerry Hairston, Jr.
Appearances %>%
  filter(playerID == "hairsje02")

# Appearances for the 1984 Cleveland Indians
Appearances %>%
  filter(teamID == "CLE" & yearID == 1984)

# Pete Rose's primary position each year of his career
Appearances %>% 
   filter(playerID == "rosepe01") %>%
   group_by(yearID, teamID) %>%
   gather(pos, G, G_1b:G_rf) %>%
   filter(G == max(G)) %>%
   select(yearID:G_all, pos, G) %>%
   mutate(pos = substring(as.character(pos), 3, 4)) %>%
   arrange(yearID, teamID)


# Most pitcher appearances each year since 1950
Appearances %>%
   filter(yearID >= 1950) %>%
   group_by(yearID) %>%
   summarise(maxPitcher = playerID[which.max(G_p)],
             maxAppear = max(G_p))

# Individuals who have played all 162 games since 1961
all162 <- Appearances %>%
              filter(yearID > 1960 & G_all == 162) %>% 
              arrange(yearID, playerID) %>%
              select(yearID:G_all)
# Number of all-gamers by year (returns a vector)
table(all162$yearID)

# Players with most pinch hitting appearances in a year
Appearances %>%
  arrange(desc(G_ph)) %>%
  select(playerID, yearID, teamID, lgID, G_all, G_ph) %>%
  head(., 10)

# Players with most pinch hitting appearances, career
Appearances %>%
  group_by(playerID) %>%
  select(playerID, G_all, G_ph) %>%
  summarise(G = sum(G_all), PH = sum(G_ph)) %>%
  arrange(desc(PH)) %>%
  head(., 10)

# Players with most career appearances at each position
Appearances %>%
  select(playerID, G_c:G_rf) %>%
  rename(C = G_c, `1B` = G_1b, `2B` = G_2b, SS = G_ss,
         `3B` = G_3b, LF = G_lf, CF = G_cf, RF = G_rf) %>%
  gather(pos, G, C:RF) %>%
  group_by(pos, playerID) %>%
  summarise(G = sum(G)) %>%
  arrange(desc(G)) %>%
  do(head(., 1))



