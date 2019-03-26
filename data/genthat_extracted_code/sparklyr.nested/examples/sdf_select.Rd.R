library(sparklyr.nested)


### Name: sdf_select
### Title: Select nested items
### Aliases: sdf_select

### ** Examples

## Not run: 
##D # produces a dataframe with an array of characteristics nested under
##D # each unique species identifier
##D iris2 <- copy_to(sc, iris, name="iris")
##D iris_nst <- iris2 %>%
##D   sdf_nest(Sepal_Length, Sepal_Width, .key="Sepal") 
##D 
##D # using java-like dot-notation
##D iris_nst %>%
##D   sdf_select(Species, Petal_Width, Sepal.Sepal_Width)
##D 
##D # using R-like dollar-sign-notation
##D iris_nst %>%
##D   sdf_select(Species, Petal_Width, Sepal$Sepal_Width)
##D   
##D # using dplyr selection helpers
##D iris_nst %>%
##D   sdf_select(Species, matches("Petal"), Sepal$Sepal_Width)
## End(Not run)



