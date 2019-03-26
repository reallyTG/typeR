library(PCMRS)


### Name: PCMRS-package
### Title: Model Response Styles in Partial Credit Models
### Aliases: PCMRS-package
### Keywords: Credit PCMRS Partial Response Style package

### ** Examples

## Don't show: 
k <- 4; n <- 80; I <- 4
set.seed(1860)
Y <- as.data.frame(matrix(sample(1:k, I*n, TRUE),nrow = n))
Y <- data.frame(lapply(Y, as.ordered))

mini.ex <- PCMRS(Y, cores = 2)
mini.ex
## End(Don't show)
## Not run: 
##D ################################################
##D ## Small example to illustrate model and person estimation
##D ################################################
##D 
##D data(tenseness)
##D 
##D set.seed(1860)
##D samples <- sample(1:nrow(tenseness), 100)
##D tense_small <- tenseness[samples,1:4]
##D 
##D m_small <- PCMRS(tense_small, cores = 2)
##D m_small
##D plot(m_small)
##D 
##D persons <- person.posterior(m_small, cores = 2)
##D plot(jitter(persons,100))
##D 
##D ################################################
##D ## Example from Tutz et al. 2017:
##D ################################################
##D 
##D data(emotion)
##D m.emotion <- PCMRS(emotion)
##D m.emotion
##D 
##D plot(m.emotion)
## End(Not run)



