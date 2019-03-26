library(dexter)


### Name: DIF
### Title: Exploratory test for Differential Item Functioning
### Aliases: DIF

### ** Examples

## Not run: 
##D db = start_new_project(verbAggrRules, "verbAggression.db", person_properties=list(gender='unknown'))
##D add_booklet(db, verbAggrData, "agg")
##D dd = DIF(db,person_property="gender")
##D print(dd)
##D plot(dd)
##D 
##D close_project(db)
## End(Not run)




