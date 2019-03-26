library(ggdag)


### Name: Test if Variable Is Collider
### Title: Detecting colliders in DAGs
### Aliases: 'Test if Variable Is Collider' is_collider
###   is_downstream_collider

### ** Examples

dag <- dagify(m ~ x + y, m_jr ~ m)
is_collider(dag, "m")
is_downstream_collider(dag, "m_jr")

#  a downstream collider is also treated as a collider
is_collider(dag, "m_jr")

#  but a direct collider is not treated as a downstream collider
is_downstream_collider(dag, "m")




