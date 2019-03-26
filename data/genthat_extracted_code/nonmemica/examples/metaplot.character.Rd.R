library(nonmemica)


### Name: metaplot.character
### Title: Metaplot Character
### Aliases: metaplot.character

### ** Examples

library(magrittr)
library(metaplot)
options(project = system.file('project/model',package='nonmemica'))
## Not run: 
##D 1001 %>% metaplot(
##D  CWRESI, TAD, SEX, 
##D  groups = c('ID','TIME'), 
##D  subset = 'MDV == 0',
##D  yref = 0, 
##D  ysmooth = TRUE
##D )
## End(Not run)



