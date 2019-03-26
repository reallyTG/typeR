library(simplegraph)


### Name: edges
### Title: Edges of a graph
### Aliases: edges

### ** Examples

bridges <- graph(list(
  "Altstadt-Loebenicht" = c(
    "Kneiphof",
    "Kneiphof",
    "Lomse"
  ),
  "Kneiphof" = c(
    "Altstadt-Loebenicht",
    "Altstadt-Loebenicht",
    "Vorstadt-Haberberg",
    "Vorstadt-Haberberg",
    "Lomse"
  ),
  "Vorstadt-Haberberg" = c(
    "Kneiphof",
    "Kneiphof",
    "Lomse"
  ),
  "Lomse" = c(
    "Altstadt-Loebenicht",
    "Kneiphof",
    "Vorstadt-Haberberg"
  )
))
edges(bridges)



