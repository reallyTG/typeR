library(sjmisc)


### Name: find_var
### Title: Find variable by name or label
### Aliases: find_var

### ** Examples

data(efc)

# find variables with "cop" in variable name
find_var(efc, "cop")

# return data frame with matching variables
find_var(efc, "cop", out = "df")

# or return column numbers
find_var(efc, "cop", out = "index")

# find variables with "dependency" in names and variable labels
library(sjlabelled)
find_var(efc, "dependency")
get_label(efc$e42dep)

# find variables with "level" in names and value labels
res <- find_var(efc, "level", search = "name_value", out = "df")
res
get_labels(res, attr.only = FALSE)

# use sjPlot::view_df() to view results
## Not run: 
##D library(sjPlot)
##D view_df(res)
## End(Not run)




