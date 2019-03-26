library(ggdag)


### Name: geom_dag_edges
### Title: Directed and bidirected DAG edges
### Aliases: geom_dag_edges

### ** Examples

dagify(y ~ x + z2 + w2 + w1,
  x ~ z1 + w1,
  z1 ~ w1 + v,
  z2 ~ w2 + v,
  w1 ~~ w2) %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_dag_edges() +
    geom_dag_node() +
    geom_dag_text() +
    theme_dag() +
    scale_dag()



