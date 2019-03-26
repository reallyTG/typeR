library(ggdag)


### Name: Equivalent DAGs and Classes
### Title: Generating Equivalent Models
### Aliases: 'Equivalent DAGs and Classes' node_equivalent_dags
###   ggdag_equivalent_dags node_equivalent_class ggdag_equivalent_class

### ** Examples

g_ex <- dagify(y ~ x + z, x ~ z)

g_ex %>% node_equivalent_class()

g_ex %>% ggdag_equivalent_dags()




