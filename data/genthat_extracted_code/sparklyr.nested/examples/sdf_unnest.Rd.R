library(sparklyr.nested)


### Name: sdf_unnest
### Title: Unnest data along a column
### Aliases: sdf_unnest

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
##D iris_nst %>% sdf_unnest(data)
## End(Not run)



