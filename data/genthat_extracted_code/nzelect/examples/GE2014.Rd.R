library(nzelect)


### Name: GE2014
### Title: General Election Results 2014
### Aliases: GE2014
### Keywords: datasets

### ** Examples

# the following matches the results published at
# http://www.electionresults.govt.nz/electionresults_2014/e9/html/e9_part1.html
library(tidyr)
library(dplyr)
GE2014 %>%
    mutate(VotingType = paste0(VotingType, "Vote")) %>%
    group_by(Party, VotingType) %>%
    summarise(Votes = sum(Votes)) %>%
    spread(VotingType, Votes) %>%
    select(Party, PartyVote, CandidateVote) %>%
    ungroup() %>%
    arrange(desc(PartyVote))



