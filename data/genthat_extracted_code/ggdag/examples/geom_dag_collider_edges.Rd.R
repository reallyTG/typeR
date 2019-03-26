library(ggdag)


### Name: geom_dag_collider_edges
### Title: Edges for paths activated by stratification on colliders
### Aliases: geom_dag_collider_edges

### ** Examples

library(dagitty)
dagify(m ~ a + b, x ~ a, y ~ b) %>%
  tidy_dagitty() %>%
  control_for("m") %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend, shape = adjusted)) +
    geom_dag_edges() +
    geom_dag_collider_edges() +
    geom_dag_node() +
    geom_dag_text() +
    theme_dag() +
    scale_dag()



