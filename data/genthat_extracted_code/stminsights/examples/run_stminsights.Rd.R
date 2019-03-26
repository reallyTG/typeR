library(stminsights)


### Name: run_stminsights
### Title: launch the stminsights shiny app
### Aliases: run_stminsights

### ** Examples


 ## Not run: 
##D 
##D library(stm)
##D library(quanteda)
##D 
##D # prepare data
##D data <- corpus(gadarian, text_field = 'open.ended.response')
##D docvars(data)$text <- texts(data)
##D data <- dfm(data, stem = TRUE, remove = stopwords('english'),
##D             remove_punct = TRUE) %>% dfm_trim(min_count = 2)
##D out <- convert(data, to = 'stm')
##D 
##D # fit models and effect estimates
##D gadarian_3 <- stm(documents = out$documents,
##D                   vocab = out$vocab,
##D                   data = out$meta,
##D                   prevalence = ~ treatment + s(pid_rep),
##D                   K = 3,
##D                   max.em.its = 1, # reduce computation time for example
##D                   verbose = FALSE)
##D 
##D prep_3 <- estimateEffect(1:3 ~ treatment + s(pid_rep), gadarian_3,
##D                          meta = out$meta)
##D 
##D gadarian_5 <- stm(documents = out$documents,
##D                   vocab = out$vocab,
##D                   data = out$meta,
##D                   prevalence = ~ treatment + s(pid_rep),
##D                   K = 5,
##D                   max.em.its = 1, # reduce computation time for example
##D                   verbose = FALSE)
##D 
##D prep_5 <- estimateEffect(1:5 ~ treatment + s(pid_rep), gadarian_5,
##D                          meta = out$meta)
##D 
##D # save objects in .RData file
##D save.image(paste0(tempdir(), '/stm_gadarian.RData'))
##D 
##D # launch the app
##D if(interactive()){
##D   run_stminsights()
##D }
##D 
## End(Not run)




