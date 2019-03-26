library(metaplot)


### Name: metaplot
### Title: Metaplot
### Aliases: metaplot

### ** Examples


library(magrittr)
library(dplyr)
library(csv)
x <- as.csv(system.file(package = 'metaplot', 'extdata/theoph.csv'))
x %<>% pack
# setOption(gg = TRUE)
# setOption(verbose = TRUE)  # all messages; equiv. to metaplot(verbose = T,...)
# setOption(verbose_densplot = TRUE) # densplot messages
# sample plots
x %>% metaplot(sres)
x %>% metaplot(site)
x %>% metaplot(conc, arm)
x %>% densplot(conc, arm)
x %>% metaplot(arm, conc)
x %>% metaplot(conc, arm, site)
x %>% metaplot(conc, site, arm)
x %>% metaplot(conc, time)
x %>% metaplot(arm, site)
x %>% metaplot(arm, site, cohort)
x %>% metaplot(arm, site, cohort, space = 'top')
x %>% metaplot(arm, site, , cohort)
x %>% metaplot(conc, time, subject)
x %>% metaplot(conc, time, , subject)
x %>% metaplot(conc, time, subject, site)
x %>% metaplot(conc, time, subject, site, arm)
x %>% metaplot(lKe, lKa, lCl)

## No test: 
x %>% metaplot(
  lKe, lKa, lCl,
  col = 'black',smooth.col = 'red', pin.col = 'red',
  dens.col='blue',dens.alpha = 0.1
)
x %>% metaplot(conc, pred, ipred, time, space = 'top')
x %>% metaplot(conc, pred, ipred, time, subject, space = 'top')
x %>% metaplot(conc, pred, ipred, time, subject,
  colors = c('black','blue','orange'),
  points = c(0.9,0, 0.4),
  lines = c(F,T,T),
  types = c('blank','dashed','solid'),
  space = 'top'
)

x %>% metaplot(conc, ipred, time, site, arm, space = 'top')
x %>% metaplot(res, conc, yref = 0, ysmooth = T, conf = T, grid = T, loc = 1)
x %>% metaplot(res, conc, arm, ysmooth = T, conf = T )
x %>% metaplot(res, conc, arm, ysmooth = T, conf = T, global = T, ref.col = 'red')
x %>% metaplot(subject,conc)

# manage metadata
attr(x$arm, 'guide') # //1/Arm A//2/Arm B//

x %>% metaplot(conc, arm) # default

x %>% mutate(arm = arm %>%
  structure(guide = '//2/Arm B//1/Arm A//')) %>%
  metaplot(conc, arm) # different presentation order

x %>% mutate(arm = arm %>%
  structure(guide = '//1/Both Arms//2/Both Arms//')) %>%
  metaplot(conc, arm) # collapse cases


## End(No test)



