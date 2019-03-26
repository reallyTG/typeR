library(sparklyr.nested)


### Name: sdf_nest
### Title: Nest data in a Spark Dataframe
### Aliases: sdf_nest

### ** Examples

## Not run: 
##D # produces a dataframe with an array of characteristics nested under
##D # each unique species identifier
##D iris2 <- copy_to(sc, iris, name="iris")
##D iris2 %>%
##D   sdf_nest(Sepal_Length, Sepal_Width, Petal_Length, Petal_Width, .key="data") %>%
##D   group_by(Species) %>%
##D   summarize(data=collect_list(data))
## End(Not run)




