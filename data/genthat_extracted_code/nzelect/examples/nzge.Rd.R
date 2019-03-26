library(nzelect)


### Name: nzge
### Title: General Election Results 2002 and onwards
### Aliases: nzge
### Keywords: datasets

### ** Examples

# the following matches the results published at
# http://www.electionresults.govt.nz/electionresults_2014/e9/html/e9_part1.html
library(tidyr)
library(dplyr)
nzge %>%
    mutate(voting_type = paste0(voting_type, " vote")) %>%
    group_by(party, voting_type, election_year) %>%
    summarise(votes = sum(votes)) %>%
    spread(voting_type, votes) %>%
    ungroup() %>%
    arrange(election_year, desc(`Party vote`))



