library(ggdag)


### Name: Colliders
### Title: Find colliders
### Aliases: Colliders node_collider ggdag_collider

### ** Examples

dag <- dagify(m ~ x + y, y ~ x)

node_collider(dag)
ggdag_collider(dag)




