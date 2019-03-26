library(Momocs)


### Name: plot_mshapes
### Title: Pairwise comparison of a list of shapes
### Aliases: plot_mshapes

### ** Examples

bot %>% efourier(6) %>% mshapes("type") %>% plot_mshapes
# above, a shortcut for working with the result of mshapes
# but works on list of shapes, eg:
leaves <- shapes %>% slice(grep("leaf", names(shapes))) %$% coo
class(leaves)
leaves %>% plot_mshapes(col2="#0000FF")



