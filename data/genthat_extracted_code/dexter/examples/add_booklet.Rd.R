library(dexter)


### Name: add_booklet
### Title: Add response data to a project
### Aliases: add_booklet add_response_data

### ** Examples

db = start_new_project(verbAggrRules, ":memory:", 
                       person_properties=list(gender="unknown"))
head(verbAggrData)
add_booklet(db, verbAggrData, "agg")      

close_project(db)




