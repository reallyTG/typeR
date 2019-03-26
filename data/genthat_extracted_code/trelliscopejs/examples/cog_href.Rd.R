library(trelliscopejs)


### Name: cog_href
### Title: Href Cognostic
### Aliases: cog_href

### ** Examples

## No test: 
library(dplyr)
library(rbokeh)
iris %>%
  group_by(Species) %>%
  summarise(
    wiki_link = cog_href(paste0("https://en.wikipedia.org/wiki/Iris_",
      tolower(Species))[1], default_label = TRUE,
      desc = "link to species on wikipedia"),
    panel = panel(figure(xlab = "Sepal Length", ylab = "Sepal Width") %>%
      ly_points(Sepal.Length, Sepal.Width))) %>%
  trelliscope(name = "iris_species", ncol = 3)
## End(No test)



