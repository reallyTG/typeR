library(dexter)


### Name: create3DC
### Title: Create a database for the 3DC standard setting application
### Aliases: create3DC

### ** Examples

## Not run: 
##D library(dplyr)
##D db = start_new_project(verbAggrRules, "verbAggression.db")
##D 
##D add_booklet(db, verbAggrData, "aggression")
##D 
##D par = fit_enorm(db) 
##D pv = plausible_values(db, par)
##D mu = mean(pv$PV1)
##D sigma = sd(pv$PV1)
##D 
##D # We'll use the behavior an item depicts as a basis for making the clusters,
##D # thus creating clusters of similar items. 
##D 
##D design = data.frame(item_id = verbAggrProperties$item_id, 
##D    cluster = verbAggrProperties$behavior)
##D 
##D # specify the actual sample for display in the group_leader page
##D 
##D population = get_testscores(db) %>% 
##D                 group_by(test_score) %>% 
##D                 summarise(frequency=n()) 
##D 
##D db3dc = create3DC('test3DC.db')
##D 
##D add_test3DC(db3dc, parms=par, design, mu=mu, sigma=sigma, 
##D             test_id='verbal_aggression', standards='verbally aggressive',
##D             population=population)
##D 
##D #get a preview
##D plot3DC(db3dc)
##D 
##D 
##D dbDisconnect(db3dc)
##D close_project(db)
## End(Not run)




