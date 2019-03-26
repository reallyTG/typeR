library(dexterMST)


### Name: import_from_dexter
### Title: import data from a dexter project
### Aliases: import_from_dexter

### ** Examples

## Not run: 
##D dbDex = start_new_project(verbAggrRules, "verbAggression.db", 
##D   person_properties=list(gender="unknown"))
##D add_booklet(dbDex, verbAggrData, "agg")
##D add_item_properties(dbDex, verbAggrProperties)
##D db = create_mst_project(':memory:')
##D import_from_dexter(db, dbDex)
##D f_mst = fit_enorm_mst(db)
##D f_dexter = fit_enorm(dbDex)
##D close_mst_project(db)
##D close_project(dbDex)
## End(Not run)





