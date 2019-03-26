library(ggdag)


### Name: geom_dag_text
### Title: Node text
### Aliases: geom_dag_text

### ** Examples

g <- dagify(m ~ x + y, y ~ x)
g %>%
tidy_dagitty() %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_dag_node() +
    geom_dag_edges() +
    geom_dag_text() +
    theme_dag() +
    scale_dag()



