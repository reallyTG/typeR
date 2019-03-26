library(mgm)


### Name: showInteraction
### Title: Retrieving details of interactions
### Aliases: showInteraction

### ** Examples


## Not run: 
##D 
##D 
##D ## We fit a pairwise and 3-order MGM to the mixed Autism dataset (?autism_data)
##D 
##D # 1) Fit Pairwise MGM
##D 
##D # Call mgm()
##D fit_d2 <- mgm(data = autism_data$data,
##D               type = autism_data$type,
##D               level = autism_data$lev,
##D               k = 2) # ad most pairwise interacitons
##D 
##D # Weighted adjacency matrix
##D fit_d2$pairwise$wadj # for instance, we see there is an interaction 1-2
##D 
##D # 2) Look at details of interaction 1-2
##D showInteraction(object = fit_d2, 
##D                 int = c(1, 2))
##D 
##D # For more examples see https://github.com/jmbh/mgmDocumentation
##D 
## End(Not run)





