library(PCMRS)


### Name: tenseness
### Title: Tenseness data from the Freiburg Complaint Checklist (tenseness)
### Aliases: tenseness
### Keywords: datasets

### ** Examples

## Not run: 
##D data(tenseness)
##D 
##D set.seed(1860)
##D samples <- sample(1:nrow(tenseness), 300)
##D tense_small <- tenseness[samples,]
##D 
##D m_small <- PCMRS(tense_small, cores = 25)
##D m_small
##D plot(m_small)
##D 
##D persons <- person.posterior(m_small, cores = 25)
##D plot(jitter(persons,100))
## End(Not run)



