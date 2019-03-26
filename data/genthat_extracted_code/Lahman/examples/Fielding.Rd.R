library(Lahman)


### Name: Fielding
### Title: Fielding table
### Aliases: Fielding
### Keywords: datasets

### ** Examples

data(Fielding)
# Basic fielding data

require("dplyr")


# Roberto Clemente's fielding profile
# pitching and catching related data removed
# subset(Fielding, playerID == "clemero01")[, 1:13]
Fielding %>% 
   filter(playerID == "clemero01") %>%
   select(1:13)
   
# Yadier Molina's fielding profile
# PB, WP, SP and CS apply to catchers
Fielding %>% 
  subset(playerID == "molinya01") %>%
  select(-WP, -ZR)

# Pedro Martinez's fielding profile
Fielding %>% subset(playerID == "martipe02")

# Table of games played by Pete Rose at different positions
with(subset(Fielding, playerID == "rosepe01"), xtabs(G ~ POS))

# Career total G/PO/A/E/DP for Luis Aparicio
Fielding %>%
    filter(playerID == "aparilu01") %>% 
    select(G, PO, A, E, DP) %>%
    summarise_each(funs(sum))


# Top ten 2B/SS in turning DPs
Fielding %>%
    subset(POS %in% c("2B", "SS")) %>%
    group_by(playerID) %>%
    summarise(TDP = sum(DP, na.rm = TRUE)) %>%
    arrange(desc(TDP)) %>%
    head(., 10)

# League average fielding statistics, 1961-present
Fielding %>% 
   filter(yearID >= 1961 & POS != "DH") %>%
   select(yearID, lgID, POS, InnOuts, PO, A, E) %>%
   group_by(yearID, lgID) %>%
   summarise_at(vars(InnOuts, PO, A, E), funs(sum), na.rm = TRUE) %>%
   mutate(fpct = round( (PO + A)/(PO + A + E), 3), 
          OPE = round(InnOuts/E, 3))





