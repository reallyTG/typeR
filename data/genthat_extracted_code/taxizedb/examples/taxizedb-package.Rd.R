library(taxizedb)


### Name: taxizedb-package
### Title: Taxonomic databases interface
### Aliases: taxizedb-package taxizedb
### Keywords: package

### ** Examples

## Not run: 
##D # IMPORTANT: Remember to start your PostgreSQL database for ITIS
##D # and ThePlantList and your MySQL database for COL
##D 
##D # data source: ITIS
##D ## download ITIS database
##D x <- db_download_itis()
##D db_load_itis(x)
##D 
##D ## connect to the ITIS database
##D src <- src_itis()
##D 
##D ## use SQL syntax
##D sql_collect(src, "select * from hierarchy limit 5")
##D ### or pipe the src to sql_collect
##D src %>% sql_collect("select * from hierarchy limit 5")
##D 
##D ## use dplyr verbs
##D src %>%
##D   tbl("hierarchy") %>%
##D   top_n(10)
##D 
##D ## or create tbl object for repeated use
##D hiers <- src %>% tbl("hierarchy")
##D hiers %>% top_n(10)
##D hiers %>% select(tsn, level)
##D 
##D 
##D # data source: theplantlist
##D ## download tpl datababase
##D x <- db_download_tpl()
##D db_load_tpl(x)
##D 
##D ## connecto the tpl database
##D src <- src_tpl()
##D 
##D ## do queries
##D tpl <- src %>% tbl("plantlist")
##D tpl %>% filter(family == "Pinaceae")
##D 
##D # data source: catalogue of life
##D ## download col datababase
##D x <- db_download_col()
##D db_load_col(x)
##D 
##D ## connecto the col database
##D src <- src_col()
##D 
##D ## do queries
##D cnames <- src %>% tbl("common_name_element")
##D cnames %>% select(name)
## End(Not run)



