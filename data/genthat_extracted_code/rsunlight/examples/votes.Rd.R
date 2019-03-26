library(rsunlight)


### Name: votes
### Title: votes methods
### Aliases: votes cg_vote cg_votes_recent cg_votes_type cg_votes_date
###   cg_votes_senatenoms cg_votes_explanations
###   cg_votes_explanations_category cg_votes_explanations_member
###   cg_votes_explanations_member

### ** Examples

## Not run: 
##D cg_vote(115, "senate", 1, 17)
##D cg_votes_recent("senate")
##D cg_votes_type(114, "house", "missed")
##D cg_votes_date("senate", year = 2017, month = 1)
##D cg_votes_date("senate", year = 2017, month = 3)
##D cg_votes_date("senate", start_date = "2017-01-03", end_date = "2017-01-31")
##D cg_votes_senatenoms(114)
##D cg_votes_explanations(114, votes = FALSE)
##D cg_votes_explanations(114, votes = TRUE)
##D cg_votes_explanations_category(114, "voted-incorrectly")
##D cg_votes_explanations_member("S001193", 115, votes = FALSE)
##D cg_votes_explanations_member("S001193", 115, votes = TRUE)
##D cg_votes_explanations_member("S001193", 115, votes = TRUE,
##D  category = "personal")
## End(Not run)



