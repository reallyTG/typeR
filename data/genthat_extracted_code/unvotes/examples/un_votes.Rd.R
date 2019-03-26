library(unvotes)


### Name: un_votes
### Title: United Nations General Assembly voting data by country and roll
###   call
### Aliases: un_votes
### Keywords: datasets

### ** Examples


library(dplyr)

# percentage yes by country
by_country <- un_votes %>%
  group_by(country) %>%
  summarize(votes = n(),
            percent_yes = mean(vote == 1))

arrange(by_country, percent_yes)
arrange(by_country, desc(percent_yes))

# combine with per-vote information
un_votes %>%
  inner_join(un_roll_calls, by = "rcid")

# combine with issue
votes_issues <- un_votes %>%
  inner_join(un_roll_call_issues, by = "rcid")

# for example, which countries voted yes least often on Colonialism
votes_issues %>%
  filter(issue == "Colonialism") %>%
  group_by(country) %>%
  summarize(percent_yes = mean(vote == 1)) %>%
  arrange(percent_yes)




