library(hansard)


### Name: all_answered_questions
### Title: All answered parliamentary questions
### Aliases: all_answered_questions hansard_all_answered_questions

### ** Examples

## Not run: 
##D # All questions answered by Nicola Blackwood from 1 January 2017 onwards
##D x <- all_answered_questions(4019, start_date = "2017-01-01")
##D 
##D # All questions answered by Nicola Blackwood from 1 January 2017 onwards
##D # returns variables in camelCase style
##D y <- all_answered_questions(4019,
##D   start_date = "2017-01-01",
##D   tidy_style = "camelCase"
##D )
##D 
##D # All questions asked by Andrew Dismore from 1 January 2017 onwards
##D z <- hansard_all_answered_questions(
##D   tabling_mp_id = 179,
##D   start_date = "2017-01-01"
##D )
##D 
##D # Return all questions asked in the House of Lords
##D # answered by the Department for Education.
##D a <- hansard_all_answered_questions(house = "lords", answering_body = 60)
##D 
##D # Returns all questions asked in the House of Lords
##D # answered by the Department for Education.
##D b <- hansard_all_answered_questions(house = 2, answering_body = "Education")
##D 
##D # Accepts multiple inputs for mp_id, tabling_mp_id and answering_body
##D w <- hansard_all_answered_questions(
##D   mp_id = c(4019, 3980),
##D   tabling_mp_id = c(338, 172),
##D   answering_body = c("health", "justice"),
##D   start_date = "2016-12-18",
##D   end_date = "2017-03-12"
##D )
## End(Not run)



