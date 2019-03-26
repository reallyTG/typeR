library(AnnotationDbi)


### Name: make_eg_to_go_map
### Title: Create GO to Entrez Gene maps for chip-based packages
### Aliases: make_eg_to_go_map make_go_to_eg_map

### ** Examples

library("hgu95av2.db")

eg2go = make_eg_to_go_map("hgu95av2.db")
sample(eg2go, 2)

go2eg = make_go_to_eg_map("hgu95av2.db")
sample(go2eg, 2)




