library(ggdag)


### Name: ggrepel functions
### Title: Repulsive textual annotations
### Aliases: 'ggrepel functions' geom_dag_text_repel geom_dag_label_repel

### ** Examples

g <- dagify(m ~ x + y,
y ~ x,
exposure = "x",
outcome = "y",
latent = "m",
labels = c("x" = "Exposure", "y" = "Outcome", "m" = "Collider"))

g %>% tidy_dagitty() %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_dag_edges() +
    geom_dag_node() +
    geom_dag_text_repel(aes(label = name), show.legend = FALSE) +
    theme_dag() +
    scale_dag()

g %>% tidy_dagitty() %>%
  dag_label(labels = c("x" = "This is the exposure",
    "y" = "Here's the outcome",
    "m" = "Here is where they collide")) %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_dag_edges() +
    geom_dag_node() +
    geom_dag_text() +
    geom_dag_label_repel(aes(label = label, fill = label),
      col = "white", show.legend = FALSE) +
    theme_dag() +
    scale_dag()



