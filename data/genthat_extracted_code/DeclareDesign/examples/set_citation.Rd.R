library(DeclareDesign)


### Name: set_citation
### Title: Set the citation of a design
### Aliases: set_citation

### ** Examples


design <-
declare_population(data = sleep) +
  declare_sampling(n = 10)

design <-
  set_citation(design,
               author = "Lovelace, Ada",
               title = "Notes",
               year = 1953,
               description = "This is a text description of a design")

cite_design(design)




