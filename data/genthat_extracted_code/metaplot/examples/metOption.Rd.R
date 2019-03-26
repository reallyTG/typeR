library(metaplot)


### Name: metOption
### Title: Get Metaplot Option with Partial Matching
### Aliases: metOption

### ** Examples


library(magrittr)
library(dplyr)
library(csv)
x <- as.csv(system.file(package = 'metaplot', 'extdata/theoph.csv'))
x %<>% pack

multiplot(
x %>% metaplot(conc, gg = F),
x %>% metaplot(conc, time, gg = F),
x %>% metaplot(conc, arm, gg = F),
x %>% metaplot(conc, arm,  gg = T)
)

# Add a reference line at 9 mg/L
x$conc %<>% structure(reference = 9)

# Make the reference line green universally.
setOption(ref_col = 'green')

# Make the reference line orange for density plots
setOption(ref_col_dens = 'orange')

multiplot(
x %>% metaplot(conc, gg = F),
x %>% metaplot(conc, time, gg = F),
x %>% metaplot(conc, arm, gg = F),
x %>% metaplot(conc, arm,  gg = T)
)

# Restore defaults
# setOption() # clears all metaplot options
setOption(ref_col = NULL)
setOption(ref_col_dens = NULL)



