library(hansard)


### Name: commons_written_questions
### Title: House of Commons Written Questions
### Aliases: commons_written_questions hansard_commons_written_questions

### ** Examples

## Not run: 
##D # Returns a tibble with written questions from Jon Trickett,
##D # answered by the Cabinet Office.
##D x <- commons_written_questions(
##D   mp_id = 410,
##D   answering_department = "cabinet office"
##D )
##D 
##D # Returns a tibble with written questions from Jon Trickett or Diane Abbott,
##D # and answered by the Cabinet Office or the Home Office.
##D x <- commons_written_questions(
##D   mp_id = c(410, 172),
##D   answering_department = c("cabinet", "home")
##D )
## End(Not run)




