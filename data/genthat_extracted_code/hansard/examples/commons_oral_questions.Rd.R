library(hansard)


### Name: commons_oral_questions
### Title: House of Commons Oral Questions
### Aliases: commons_oral_questions hansard_commons_oral_questions

### ** Examples

## Not run: 
##D 
##D # Oral questions from a single MP to a single department
##D x <- commons_oral_questions(mp_id = 4019, answering_department = "education")
##D 
##D 
##D ## Questions from multiple MPs and to multiple departments
##D y <- commons_oral_questions(
##D   mp_id = c(4019, 4051, 4588),
##D   answering_department = c("education", "health")
##D )
## End(Not run)




