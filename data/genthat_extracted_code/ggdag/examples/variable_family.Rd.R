library(ggdag)


### Name: Assess familial relationships between variables
### Title: Familial relationships between variables
### Aliases: 'Assess familial relationships between variables'
###   node_children node_parents node_ancestors node_descendants
###   node_markov_blanket node_adjacent ggdag_children ggdag_parents
###   ggdag_ancestors ggdag_descendants ggdag_markov_blanket ggdag_adjacent

### ** Examples

dag <- dagify(y ~ x + z2 + w2 + w1,
  x ~ z1 + w1,
  z1 ~ w1 + v,
  z2 ~ w2 + v,
  w1 ~~ w2)

ggdag_children(dag, "w1")

dag %>%
  node_children("w1") %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend, color = children)) +
  geom_dag_edges() +
  geom_dag_node() +
  geom_dag_text(col = "white") +
  geom_dag_label_repel(aes(label = children, fill = children), col = "white", show.legend = FALSE) +
  theme_dag() + scale_dag(breaks  = c("parent", "child"))

ggdag_parents(dag, "y")

ggdag_ancestors(dag, "x")

ggdag_descendants(dag, "w1")

dag %>%
  node_parents("y") %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend, color = parent)) +
  geom_dag_edges() +
  geom_dag_node() +
  geom_dag_text(col = "white") +
  geom_dag_label_repel(aes(label = parent, fill = parent), col = "white", show.legend = FALSE) +
  theme_dag() + scale_dag(breaks  = c("parent", "child"))




