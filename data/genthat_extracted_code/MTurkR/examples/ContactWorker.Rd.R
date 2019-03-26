library(MTurkR)


### Name: ContactWorker
### Title: Contact Worker(s)
### Aliases: ContactWorker ContactWorkers contact
### Keywords: Workers

### ** Examples

## Not run: 
##D a <- "Complete a follow-up survey for $.50"
##D b <- "Thanks for completing my HIT!
##D I will pay a $.50 bonus if you complete a follow-up survey by Friday at 5:00pm.
##D The survey can be completed at
##D http://www.surveymonkey.com/s/pssurvey?c=A1RO9UEXAMPLE."
##D 
##D # contact one worker
##D c1 <- "A1RO9UEXAMPLE"
##D d <- ContactWorker(subjects = a,
##D                    msgs = b,
##D                    workers = c1)
##D 
##D # contact multiple workers in batch
##D c2 <- c("A1RO9EXAMPLE1","A1RO9EXAMPLE2","A1RO9EXAMPLE3")
##D e <- ContactWorker(subjects = a,
##D                    msgs = b,
##D                    workers = c2,
##D                    batch = TRUE)
## End(Not run)



