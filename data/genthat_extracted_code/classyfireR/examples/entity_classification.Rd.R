library(classyfireR)


### Name: entity_classification
### Title: Entity Classification
### Aliases: entity_classification

### ** Examples


# Valid InChI key where all four classification levels are available
entity_classification('BRMWTNUJHUMWMS-LURJTMIESA-N')

# Valid InChI key where only three classification levels are available
entity_classification('MDHYEMXUFSJLGV-UHFFFAOYSA-N')

# Invalid InChI key
entity_classification('MDHYEMXUFSJLGV-UHFFFAOYSA-B')


# Using `dplyr` a vector of InChI Keys can be submitted and easily parsed
  library(dplyr)
  library(purrr)
  library(tidyr)

 keys <- c(
'BRMWTNUJHUMWMS-LURJTMIESA-N',
'XFNJVJPLKCPIBV-UHFFFAOYSA-N',
'TYEYBOSBBBHJIV-UHFFFAOYSA-N',
'AFENDNXGAFYKQO-UHFFFAOYSA-N',
'WHEUWNKSCXYKBU-QPWUGHHJSA-N',
'WHBMMWSBFZVSSR-GSVOUGTGSA-N')

 classification_list <- map(keys, entity_classification)

 classification_list <- map(classification_list, ~{select(.,-CHEMONT)})

 spread_tibble <- purrr:::map(classification_list, ~{
                  spread(., Level, Classification)
                  }) %>% bind_rows() %>% data.frame()

 rownames(spread_tibble) <- keys

 classification_df <-  data.frame(InChIKey = rownames(spread_tibble),
                               Kingdom = spread_tibble$kingdom,
                                SuperClass = spread_tibble$superclass,
                                Class = spread_tibble$class,
                                SubClass = spread_tibble$subclass)

 print(classification_df)






