library(congressbr)


### Name: vote_to_rollcall
### Title: Create rollcall or matrix format data structures from voting
###   records
### Aliases: vote_to_rollcall

### ** Examples

# get votes:
data(sen_nominal_votes)
votes <- sen_nominal_votes %>%
    dplyr::filter(vote_date >= "2005-03-01", vote_date <= "2007-12-15")
rc <- vote_to_rollcall(votes$senator_vote,
                       legislators = votes$senator_name,
                       bills = votes$bill_id)



