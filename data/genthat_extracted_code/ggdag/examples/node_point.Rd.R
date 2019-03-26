library(ggdag)


### Name: Nodes
### Title: DAG Nodes
### Aliases: Nodes geom_dag_node geom_dag_point

### ** Examples

g <- dagify(m ~ x + y, y ~ x)
p <- g %>%
  tidy_dagitty() %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_dag_edges() +
    theme_dag() +
    scale_dag()

p +
  geom_dag_node() +
  geom_dag_text()

p +
  geom_dag_point() +
  geom_dag_text()



