library(nonmemica)


### Name: metasuperset
### Title: Retrieve Model Outputs with Metadata
### Aliases: metasuperset

### ** Examples

library(magrittr)
options(project = system.file('project/model',package='nonmemica'))
1001 %>% metasuperset(c('ID','TIME')) %>% head



