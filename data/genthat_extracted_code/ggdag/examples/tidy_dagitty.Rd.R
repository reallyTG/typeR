library(ggdag)


### Name: tidy_dagitty
### Title: Tidy a 'dagitty' object
### Aliases: tidy_dagitty

### ** Examples

library(dagitty)
library(ggplot2)

dag <- dagitty( "dag {
  Y <- X <- Z1 <- V -> Z2 -> Y
  Z1 <- W1 <-> W2 -> Z2
  X <- W1 -> Y
  X <- W2 -> Y
  X [exposure]
  Y [outcome]
  }")

tidy_dagitty(dag)

tidy_dagitty(dag, layout = "fr") %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_dag_node() +
    geom_dag_text() +
    geom_dag_edges() +
    theme_dag() +
    scale_dag()



