library(Lahman)


### Name: FieldingPost
### Title: FieldingPost data
### Aliases: FieldingPost
### Keywords: datasets

### ** Examples

require("dplyr")

## World Series fielding record for Yogi Berra
FieldingPost %>%
  filter(playerID == "berrayo01" & round == "WS")

## Yogi's career efficiency in throwing out base stealers 
## in his WS appearances and CS as a percentage of his 
## overall assists
FieldingPost %>%
  filter(playerID == "berrayo01" & round == "WS" & POS == "C") %>%
  summarise(cs_pct = round(100 * sum(CS)/sum(SB + CS), 2),
            cs_assists = round(100 * sum(CS)/sum(A), 2))

## Innings per error for several selected shortstops in the WS
FieldingPost %>%
  filter(playerID %in% c("belanma01", "jeterde01", "campabe01",
                         "conceda01", "bowala01"), round == "WS") %>%
  group_by(playerID) %>%
  summarise(G = sum(G),
            InnOuts = sum(InnOuts),
            Eper9 = round(27 * sum(E)/sum(InnOuts), 3))


## Top 10 center fielders in innings played in the WS
FieldingPost %>%
  filter(POS == "CF" & round == "WS") %>%
  group_by(playerID) %>%
  summarise(inn_total = sum(InnOuts)) %>%
  arrange(desc(inn_total)) %>%
  head(., 10)

## Most total chances by position
FieldingPost %>%
  filter(round == "WS" & !(POS %in% c("DH", "OF", "P"))) %>%
  group_by(POS, playerID) %>%
  summarise(TC = sum(PO + A + E)) %>%
  arrange(desc(TC)) %>%
  do(head(., 1))    # provides top player by position




