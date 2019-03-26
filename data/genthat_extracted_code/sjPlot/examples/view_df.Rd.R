library(sjPlot)


### Name: view_df
### Title: View structure of labelled data frames
### Aliases: view_df

### ** Examples

## Not run: 
##D # init dataset
##D data(efc)
##D 
##D # view variables
##D view_df(efc)
##D 
##D # view variables w/o values and value labels
##D view_df(efc, show.values = FALSE, show.labels = FALSE)
##D 
##D # view variables including variable typed, orderd by name
##D view_df(efc, sort.by.name = TRUE, show.type = TRUE)
##D 
##D # User defined style sheet
##D view_df(efc,
##D         CSS = list(css.table = "border: 2px solid;",
##D                    css.tdata = "border: 1px solid;",
##D                    css.arc = "color:blue;"))
## End(Not run)




