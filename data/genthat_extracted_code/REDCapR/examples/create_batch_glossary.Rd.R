library(REDCapR)


### Name: create_batch_glossary
### Title: Creates a 'base::data.frame()' that help batching long-running
###   read and writes.
### Aliases: create_batch_glossary

### ** Examples

library(REDCapR) #Load the package into the current R session.
create_batch_glossary(100, 50)
create_batch_glossary(100, 25)
create_batch_glossary(100, 3)
d <- data.frame(
  record_id = 1:100,
  iv        = sample(x=4, size=100, replace=TRUE),
  dv        = rnorm(n=100)
)
create_batch_glossary(nrow(d), batch_size=40)



