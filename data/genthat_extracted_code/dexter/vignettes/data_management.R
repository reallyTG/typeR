## ---- message=FALSE------------------------------------------------------
library(dplyr)
library(dexter)

db = start_new_project(verbAggrRules, "verbAggression.db", 
                       covariates = list(gender="<unknown>"))

## ------------------------------------------------------------------------
add_booklet(db, x=verbAggrData, booklet_id="agg")

## ------------------------------------------------------------------------
add_item_properties(db, verbAggrProperties)

## ------------------------------------------------------------------------

get_responses(db, columns = c('item_id','response')) %>%
  group_by(item_id, response) %>%
  summarise(count = n()) %>%
  slice(1:10)
  

## ---- fig.height=5,fig.width=7-------------------------------------------
scores = get_responses(db, columns = c('person_id','item_score','situation')) %>%
  group_by(person_id, situation) %>%
  summarise(situation_score = sum(item_score))  

par(bty='n', fg='white')

boxplot(situation_score ~ situation, scores, border='black')


## ------------------------------------------------------------------------
get_variables(db)

## ---- eval=FALSE---------------------------------------------------------
#  par = fit_enorm(db, gender=='female' & !(booklet_id == 'pretest' & item_position == 3))

## ---- eval=FALSE---------------------------------------------------------
#  bkl = 'pretest'
#  par = fit_enorm(db, gender=='female' & !(booklet_id == bkl & item_position == 3))

## ---- eval=FALSE---------------------------------------------------------
#  booklet_id = 'pretest' # local variable
#  par = fit_enorm(db, gender=='female' & !(booklet_id == local(booklet_id) & item_position == 3))

## ---- eval=FALSE---------------------------------------------------------
#  # assuming an item property called `cefr_level` exists in the project
#  design = design_as_network(db, booklet_id %in% c('bookletA','bookletX','bookletY') & cefr_level == 'B1')
#  design_is_connected(design)
#  ## [1] TRUE

## ---- eval=FALSE---------------------------------------------------------
#  par = fit_enorm(db, response != 'NA')

## ---- eval=FALSE---------------------------------------------------------
#  # goal: fit the extended nominal response model using only persons without any missing responses
#  
#  data = get_responses(db, columns=c('person_id','item_id','item_score','response')) %>%
#      group_by(person_id) %>%
#      mutate(any_missing = any(response == 'NA')) %>%
#      ungroup() %>%
#      filter(!any_missing)
#  
#  # the manipulated data can be fed back to the analysis function
#  par = fit_enorm(data)

## ---- show=FALSE---------------------------------------------------------
close_project(db)

