library(pinnacle.data)


### Name: MLB2016
### Title: MLB2016.
### Aliases: MLB2016
### Keywords: datasets

### ** Examples

if (require("tidyverse")) {
library(tidyverse)
# What was the range of expected total runs according to the prediction market at Pinnacle?
MLB2016 %>% 
 unnest() %>% 
 group_by(GameID) %>% 
 arrange(desc(EnteredDateTimeUTC)) %>% 
 slice(1) %>% 
 ungroup() %>% 
 group_by(TotalPoints) %>% 
 summarize(Count = n())

# How many games went Over/Under/Landed on the total?
MLB2016 %>% 
 unnest() %>% 
 group_by(GameID) %>% 
 arrange(desc(EnteredDateTimeUTC)) %>% 
 slice(1) %>% 
 ungroup() %>% 
 select(GameID,TotalPoints,FinalScoreAway,FinalScoreHome) %>% 
 mutate(TotalOutcome = case_when(
   FinalScoreAway + FinalScoreHome > TotalPoints ~ "Over",
   FinalScoreAway + FinalScoreHome < TotalPoints ~ "Under",
   FinalScoreAway + FinalScoreHome == TotalPoints ~ "Landed"
 )
 ) %>% 
 group_by(TotalPoints,TotalOutcome) %>% 
 summarize(Count = n()) %>% 
 print(n=100)
}



