library(googlesheets)


### Name: gs_read_listfeed
### Title: Read data via the "list feed"
### Aliases: gs_read_listfeed

### ** Examples

## Not run: 
##D gap_ss <- gs_gap() # register the Gapminder example sheet
##D oceania_lf <- gs_read_listfeed(gap_ss, ws = "Oceania")
##D head(oceania_lf, 3)
##D 
##D ## do row ordering and filtering in the API call
##D oceania_fancy <-
##D   gs_read_listfeed(gap_ss,
##D                    ws = "Oceania",
##D                    reverse = TRUE, orderby = "gdppercap",
##D                    sq = "lifeexp > 79 or year < 1960")
##D oceania_fancy
##D 
##D ## passing args through to readr::type_convert()
##D oceania_crazy <-
##D   gs_read_listfeed(gap_ss,
##D                    ws = "Oceania",
##D                    col_names = paste0("z", 1:6), skip = 1,
##D                    col_types = "ccncnn",
##D                    na = "1962")
##D oceania_crazy
## End(Not run)




