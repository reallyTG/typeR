library(nonmemica)


### Name: superset.character
### Title: Coerce to Superset from Character
### Aliases: superset.character

### ** Examples

library(magrittr)
library(dplyr)
library(wrangle)
options(project = system.file('project/model',package='nonmemica'))
1001 %>% superset %>% head
1001 %>% superset %>% filter(VISIBLE == 1) %>% group_by(ID,TIME) %>% status



