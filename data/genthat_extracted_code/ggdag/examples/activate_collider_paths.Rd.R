library(ggdag)


### Name: activate_collider_paths
### Title: Activate paths opened by stratifying on a collider
### Aliases: activate_collider_paths

### ** Examples

dag <- dagify(m ~ x + y, x ~ y)

collided_dag <- activate_collider_paths(dag, adjust_for = "m")
collided_dag




