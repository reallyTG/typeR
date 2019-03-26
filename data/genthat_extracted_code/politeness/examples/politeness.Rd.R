library(politeness)


### Name: politeness
### Title: Politeness Features
### Aliases: politeness

### ** Examples


data("phone_offers")

politeness(phone_offers$message, parser="none",drop_blank=FALSE)

colMeans(politeness(phone_offers$message, parser="none", metric="binary", drop_blank=FALSE))
colMeans(politeness(phone_offers$message, parser="none", metric="count", drop_blank=FALSE))

dim(politeness(phone_offers$message, parser="none",drop_blank=FALSE))
dim(politeness(phone_offers$message, parser="none",drop_blank=TRUE))

## Not run: 
##D # Detect multiple cores automatically for parallel processing
##D politeness(phone_offers$message, num_mc_cores=parallel::detectCores())
##D 
##D # Connect to SpaCy installation for part-of-speech features
##D install.packages("spacyr")
##D spacyr::spacy_initialize(python_executable = PYTHON_PATH)
##D politeness(phone_offers$message, parser="spacy",drop_blank=FALSE)
##D 
## End(Not run)







