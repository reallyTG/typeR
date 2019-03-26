library(nonmemica)


### Name: partab.character
### Title: Create a Parameter Table from Model Name
### Aliases: partab.character

### ** Examples

library(magrittr)
options(project = system.file('project/model',package='nonmemica'))
1001 %>% partab
1001 %>% partab(shrinkage = TRUE, correlation = TRUE)



