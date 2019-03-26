library(ggdag)


### Name: DAG Edges
### Title: Directed DAG edges
### Aliases: 'DAG Edges' geom_dag_edges_link geom_dag_edges_arc
###   geom_dag_edges_diagonal geom_dag_edges_fan

### ** Examples

p <- dagify(y ~ x + z2 + w2 + w1,
  x ~ z1 + w1,
  z1 ~ w1 + v,
  z2 ~ w2 + v,
  L ~ w1 + w2) %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_dag_node() +
    geom_dag_text() +
    theme_dag() +
    scale_dag()

p + geom_dag_edges_link()
p + geom_dag_edges_arc()
p + geom_dag_edges_diagonal()




