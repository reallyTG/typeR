library(sparklyr.nested)


### Name: sdf_explode
### Title: Explode data along a column
### Aliases: sdf_explode

### ** Examples

## Not run: 
##D # first get some nested data
##D iris2 <- copy_to(sc, iris, name="iris")
##D iris_nst <- iris2 %>%
##D   sdf_nest(Sepal_Length, Sepal_Width, Petal_Length, Petal_Width, .key="data") %>%
##D   group_by(Species) %>%
##D   summarize(data=collect_list(data))
##D 
##D # then explode it
##D iris_nst %>% sdf_explode(data)
## End(Not run)



