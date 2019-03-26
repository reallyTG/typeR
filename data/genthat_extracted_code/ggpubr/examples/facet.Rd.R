library(ggpubr)


### Name: facet
### Title: Facet a ggplot into Multiple Panels
### Aliases: facet

### ** Examples

p <- ggboxplot(ToothGrowth, x = "dose", y = "len",
      color = "supp")
print(p)

facet(p, facet.by = "supp")

# Customize
facet(p + theme_bw(), facet.by = "supp",
  short.panel.labs = FALSE,   # Allow long labels in panels
  panel.labs.background = list(fill = "steelblue", color = "steelblue")
)



