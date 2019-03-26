library(metaplot)


### Name: categorical_data_frame
### Title: Categorical Function for Data Frame
### Aliases: categorical_data_frame

### ** Examples


library(magrittr)
library(dplyr)
library(csv)
x <- as.csv(system.file(package = 'metaplot', 'extdata/theoph.csv'))
x %<>% pack
x %>% metaplot(site)
x %>% metaplot(site, gg = T)
x %>% metaplot(arm, site)
x %>% metaplot(arm, site, gg = T)
x %>% metaplot(arm, site, cohort)
x %>% metaplot(arm, site, cohort, gg = T)
x %>% metaplot(arm, site, cohort, space = 'top')
x %>% metaplot(arm, site, , cohort)
x %>% metaplot(arm, site, , cohort, gg = T)
## No test: 
x %>% metaplot(arm, site, , cohort, rot = c(0,90))
x %>% metaplot(arm, site, , cohort, rot = c(0,90), gg = T)
x %>% metaplot(arm, site, , cohort, rot = c(45, 45))
x %>% metaplot(subject,cohort,arm, site, lines = F, rot = c(45,45))
x %>% metaplot(subject,cohort,arm, site, lines = F, rot = c(45,45), gg=T)
# panel-specific axis not well-supported for gg version
x %>% metaplot(subject,cohort,,arm, site)
x %>% metaplot(subject,cohort,,arm, site, gg=T)
## End(No test)



