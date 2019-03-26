library(dexter)


### Name: start_new_project_from_oplm
### Title: Start a new project from oplm files
### Aliases: start_new_project_from_oplm

### ** Examples

## No test: 
db = start_new_project_from_oplm('test.db',
   'path_to_scr_file', 'path_to_dat_file', 
   booklet_position=c(1,3), responses_start=101,
   person_id=c(50,62))

prms = fit_enorm(db, 
   item_global_on_off==1 & item_local_on_off==1 & booklet_on_off==1)


## End(No test)



