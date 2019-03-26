library(fbar)


### Name: gene_associate
### Title: Apply gene expressions to reaction table
### Aliases: gene_associate

### ** Examples

data(iJO1366)
library(dplyr)

gene_table = data_frame(name = iJO1366$geneAssociation %>%
stringr::str_split('and|or|\\s|\\(|\\)') %>%
  purrr::flatten_chr() %>%
  unique,
presence = 1) %>%
  filter(name != '', !is.na(name))

gene_associate(reaction_table = iJO1366 %>%
                 mutate(geneAssociation = geneAssociation %>%
                          stringr::str_replace_all('and', '&') %>%
                          stringr::str_replace_all('or', '|')
                 ),
               gene_table = gene_table
)



