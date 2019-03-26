library(metaplot)


### Name: test_metaplot
### Title: Test Metaplot Variants
### Aliases: test_metaplot

### ** Examples


library(magrittr)
library(dplyr)
library(csv)
x <- as.csv(system.file(package = 'metaplot', 'extdata/theoph.csv'))
x %<>% pack
## No test: 
multiplot(
x %>% metaplot(sres, gg = F),
x %>% metaplot(sres, gg = T, padding = 3.5)
)
multiplot(
x %>% metaplot(site, gg = F),
x %>% metaplot(site, gg = T, padding = 3.5)
)
multiplot(
x %>% metaplot(conc, arm, gg = F),
x %>% metaplot(conc, arm, gg = T, padding = 4)
)
multiplot(
x %>% densplot(conc, arm, gg = F),
x %>% densplot(conc, arm, gg = T, padding = 8)
)
multiplot(
x %>% densplot(
  conc, arm, gg = F, space = 'top',
  columns = 2,
  legend.direction = 'horizontal' # ignored
),
x %>% densplot(conc, arm, gg = T, space = 'top',
  columns = 2, # ignored
  legend.direction = 'horizontal' , padding = 3
))
multiplot(
x %>% metaplot(arm, conc, gg = F),
x %>% metaplot(arm, conc, gg = T, padding = 3.5)
)
multiplot(
x %>% metaplot(conc, arm, site, gg = F),
x %>% metaplot(conc, arm, site, gg = T, padding = 5)
)
multiplot(
x %>% metaplot(conc, site, arm, gg = F),
x %>% metaplot(conc, site, arm, gg = T, padding = 5)
)
multiplot(
x %>% metaplot(conc, time, gg = F),
x %>% metaplot(conc, time, gg = T, padding = 5)
)
multiplot(
x %>% metaplot(arm, site, gg = F),
x %>% metaplot(arm, site, gg = T, padding = 3)
)
multiplot(
x %>% metaplot(arm, site, cohort, gg = F),
x %>% metaplot(arm, site, cohort, gg = T, padding = 5)
)
multiplot(
x %>% metaplot(arm, site, cohort, gg = F, space = 'top',
  columns = 2, padding = c(5,1,1,1)),
x %>% metaplot(arm, site, cohort, gg = T, space = 'top',
  legend.direction = 'horizontal', padding = 2)
)
multiplot(
x %>% metaplot(arm, site, , cohort, gg = F),
x %>% metaplot(arm, site, , cohort, gg = T, padding = 4)
)
multiplot(
x %>% metaplot(conc, time, subject, gg = F),
x %>% metaplot(conc, time, subject, gg = T, padding = 3)
)
multiplot(
x %>% metaplot(conc, time, , subject, gg = F),
x %>% metaplot(conc, time, , subject, gg = T, padding = 5)
)
multiplot( ncol = 2,
x %>% metaplot(conc, time, subject, site, gg = F),
x %>% metaplot(conc, time, subject, site, gg = T, padding = 4)
)
multiplot(
x %>% metaplot(conc, time, subject, site, arm, gg = F, padding = 2),
x %>% metaplot(conc, time, subject, site, arm, gg = T)
)
multiplot(
x %>% metaplot(lKe, lKa, lCl, gg = F),
x %>% metaplot(lKe, lKa, lCl, gg = T, padding = 2)
)
multiplot(
x %>% metaplot(
  lKe, lKa, lCl,
  col = 'black',smooth.col = 'red', pin.col = 'red',
  dens.col = 'blue', dens.alpha = 0.1, gg = F
),
x %>% metaplot(
  lKe, lKa, lCl,
  col = 'black',smooth.col = 'red', pin.col = 'red',
  dens.col='blue',dens.alpha = 0.1, gg = T, padding = 2)
)
multiplot(
x %>% metaplot(conc, pred, ipred, time, space = 'top', gg = F),
x %>% metaplot(conc, pred, ipred, time, space = 'top', gg = T, padding = 3)
)
multiplot(
x %>% metaplot(conc, pred, ipred, time, subject, space = 'top', gg = F),
x %>% metaplot(conc, pred, ipred, time, subject, space = 'top', gg = T, padding = 5)
)
multiplot(
x %>% metaplot(
  conc, pred, ipred, time, subject,
  colors = c('black','blue','orange'),
  points = c(0.9,0, 0.4),
  lines = c(F,T,T),
  space = 'top', gg = F
),
x %>% metaplot(
  conc, pred, ipred, time, subject,
  colors = c('black','blue','orange'),
  points = c(0.9,0, 0.4),
  lines = c(F,T,T),
  space = 'top', gg = T, padding = 4
))
multiplot(
x %>% metaplot(conc, ipred, time, site, arm, space = 'top', gg = F),
x %>% metaplot(conc, ipred, time, site, arm, space = 'top', gg = T)
)
multiplot(
x %>% metaplot(res, conc, yref = 0, ysmooth = T, conf = T, grid = T, loc = 1, gg = F),
x %>% metaplot(res, conc, yref = 0, ysmooth = T, conf = T, grid = T, loc = 1, gg = T, padding = 3.5)
)
multiplot(
x %>% metaplot(res, conc, arm, ysmooth = T, conf = T , gg = F),
x %>% metaplot(res, conc, arm, ysmooth = T, conf = T , gg = T, padding = 3.5)
)
# Fill color can differ from point color but is the same for points and regions.
# 'points' controls alpha of point and point fill independently of conf.fill.
multiplot(
x %>% metaplot(res, conc, arm, conf = T , gg = F, yref = NULL, points = 0.3,
  symbols = 21:22, colors = c('blue','black'), fill = c('green','red')
),
x %>% metaplot(res, conc, arm, conf = T , gg = T, yref = NULL, points = 0.3, padding = 3.5,
  symbols = 21:22, colors = c('blue','black'), fill = c('green','red')
))
multiplot(
x %>% metaplot(res, conc, arm, ysmooth = T, conf = T, global = T,
  ref.col = 'red', gg = F),
x %>% metaplot(res, conc, arm, ysmooth = T, conf = T, global = T,
  ref.col = 'red', gg = T, padding = 3.5)
)
multiplot(
x %>% metaplot(subject,conc, gg = F),
x %>% metaplot(subject,conc, gg = T, padding = 3.5)
)

# manage metadata
attr(x$arm, 'guide') # //1/Arm A//2/Arm B//
multiplot(
x %>% metaplot(conc, arm, gg = F),
x %>% metaplot(conc, arm, gg = T, padding = 4)
) # default

multiplot(
x %>% mutate(arm = arm %>%
  structure(guide = '//2/Arm B//1/Arm A//')) %>%
  metaplot(conc, arm, gg = F),
x %>% mutate(arm = arm %>%
  structure(guide = '//2/Arm B//1/Arm A//')) %>%
  metaplot(conc, arm, gg = T, padding = 4) # different presentation order
)

multiplot(
x %>% mutate(arm = arm %>%
  structure(guide = '//1/Both Arms//2/Both Arms//')) %>%
  metaplot(conc, arm, gg = F),
x %>% mutate(arm = arm %>%
  structure(guide = '//1/Both Arms//2/Both Arms//')) %>%
  metaplot(conc, arm, gg = T, padding = 4) # collapse cases
)

x %>% densplot(
 main = 'Density Plot',
 sub = 'using lattice',
 gg = F,
 sres, subject,
 ref.col = 'red', ref.alpha = 0.5,
 ref.lty = 'dashed', ref.lwd = 2,
 log = F,
 aspect = NULL,
 colors = c('red','blue','darkgreen'),
 symbols = c(21, 22, 23),
 points = 0.3,
 lines = .5,
 fill = 0.1,
 space = 'left',
 padding = c(1,2,3,4),
 other = 'none'
)
x %>% densplot(
 main = 'Density Plot',
 sub = 'using ggplot',
 gg = T,
 sres, subject,
 ref.col = 'red', ref.alpha = 0.5,
 ref.lty = 'dashed', ref.lwd = 2,
 log = F,
 aspect = NULL,
 colors = c('red','blue','darkgreen'),
 symbols = c(21, 22, 23),
 points = 0.3,
 lines = 0.5,
 fill = 0.1,
 space = 'left',
 padding = 1:4,
 other = 'none'
)
x %>% filter(conc > 0) %>% metaplot(
 main = 'Box Plot',
 sub = 'using lattice',
 gg = F,
 arm, conc,
 log = T,
 ref = 4, ref.col = 'red',
 ref.lty = 'dashed', ref.lwd = 2,
 nobs = T,
 padding = 1:4,
 reverse = FALSE,
 pch = 20,
 notch = TRUE,
 aspect = NA,
 other = 'none'
)

x %>% filter(conc > 0) %>% metaplot(
 main = 'Box Plot',
 sub = 'using ggplot',
 gg = T,
 arm, conc,
 log = T,
 ref = 4, ref.col = 'red',
 ref.lty = 'dashed', ref.lwd = 2,
 nobs = T,
 padding = 1:4,
 reverse = FALSE,
 pch = 20,
 notch = TRUE,
 aspect = NA,
 other = 'none'
)
x %>% metaplot(
 main = 'Categorical Plot',
 sub = 'using lattice',
 gg = F,
 arm, site, cohort,
 aspect = 'fill', space = 'top',
 as.table = FALSE,
 colors = c('red','blue','green'),
 fill = c(0.3, 0.5, 0.7),
 lines = c(0.7, 0.5, 0.3),
 tex = 0.8, rot = 45,
 padding = 1:4, loc = 1,
 cex = .5,
 other = 'none'
)

x %>% metaplot(
 main = 'Categorical Plot',
 sub = 'using ggplot2',
 gg = T,
 arm, site, cohort,
 aspect = 'fill', space = 'top',
 as.table = FALSE,
 colors = c('red','blue','green'),
 fill = c(0.3, 0.5, 0.7),
 lines = c(0.7, 0.5, 0.3),
 tex = 0.8, rot = 45,
 padding = 1:4, loc = 1,
 cex = .5,
 other = 'none'
)
x %>% metaplot(
  main = 'Correlation Splom',
  sub = 'using lattice',
  gg = F,
  lKe, lKa, lCl,
  varname.cex = 2,
  col = 'purple',
  smooth.col = 'orange', smooth.alpha = 0.9,
  smooth.lty = 'dashed', smooth.lwd = 2,
  pin.col = 'orange', pin.alpha = 0.9,
  dens.col = 'purple',dens.alpha = 0.2, dens.scale = 0.1,
  padding = 1:4,
  other = 'none',
  xlab = 'parameters'
)
x %>% metaplot(
  main = 'Correlation Splom',
  sub = 'using ggplot',
  gg = T,
  lKe, lKa, lCl,
  varname.cex = 2,
  col = 'purple',
  smooth.col = 'orange', smooth.alpha = 0.9,
  smooth.lty = 'dashed', smooth.lwd = 2,
  pin.col = 'orange', pin.alpha = 0.9,
  dens.col = 'purple',dens.alpha = 0.2, dens.scale = 0.1,
  padding = 1:4,
  other = 'none',
  xlab = 'parameters'
)
x %>% metaplot(
  main = 'Scatterplot',
  sub = 'using lattice',
  gg = F,
  res, conc,
  yref = 0, ysmooth = T,
  smooth.lty = 'dotted', smooth.lwd = 2,
  smooth.alpha = 1,
  aspect = 0.8,
  space = 'bottom',
  colors = c('purple','darkgreen','peach'),
  symbols = 21:23,
  points = c(0.3, 0.5, 0.7),
  lines = F,
  padding = 1:4,
  ref.col = 'blue',
  ref.lty = 'dashed', ref.lwd = 2,
  ref.alpha = 0.5,
  conf = .99999,
  fit.lty = 'dashed', fit.lwd = 2,
  fit.alpha = 0.5,
  conf.alpha = 0.2,
  global = T,
  global.col = 'darkgreen',
  grid = T, loc = 1,
  other = 'none'
 )
x %>% metaplot(
  main = 'Scatterplot',
  sub = 'using ggplot',
  gg = T,
  res, conc,
  yref = 0, ysmooth = T,
  smooth.lty = 'dotted', smooth.lwd = 2,
  smooth.alpha = 1,
  aspect = 0.8,
  space = 'bottom',
  colors = c('purple','darkgreen','peach'),
  symbols = 21:23,
  points = c(0.3, 0.5, 0.7),
  lines = F,
  padding = 1:4,
  ref.col = 'blue',
  ref.lty = 'dashed', ref.lwd = 2,
  ref.alpha = 0.5,
  conf = .99999,
  fit.lty = 'dashed', fit.lwd = 2,
  fit.alpha = 0.5,
  conf.alpha = 0.2,
  global = T,
  global.col = 'darkgreen',
  grid = T, loc = 1,
  other = 'none'
 )

 # vectorized reference aesthetics
multiplot(
  x %>% metaplot(
   sres, gg = F,
   ref.col = c('blue','red'),
   ref.lty = c('dashed','dotted')
  ),
  x %>% metaplot(
   sres, gg = T,
   ref.col = c('blue','red'),
   ref.lty = c('dashed','dotted'),
   padding = 3.5
  )
)
multiplot(
  x %>% densplot(
   sres, arm, gg = F,
   ref.col = c('blue','red'),
   ref.lty = c('dashed','dotted')
  ),
  x %>% densplot(
   sres, arm, gg = T,
   ref.col = c('blue','red'),
   ref.lty = c('dashed','dotted'),
   padding = 3.5
  )
)
multiplot(
  x %>% densplot(
   sres,, arm, gg = F,
   ref.col = c('blue','red'),
   ref.lty = c('dashed','dotted')
  ),
  x %>% densplot(
   sres,, arm, gg = T,
   ref.col = c('blue','red'),
   ref.lty = c('dashed','dotted'),
   padding = 3.5
 )
)
multiplot(
  x %>% metaplot(
   sres, time,, arm, gg = F,
   yref = c(-4,0,4),
   xref = c(5, 10, 15),
   yref.col = c('blue','red'),
   yref.lty = c('dashed','dotted'),
   xref.col = c('green','orange')
  ),
  x %>% metaplot(
   sres, time,, arm, gg = T,
   yref = c(-4,0,4),
   xref = c(5, 10, 15),
   yref.col = c('blue','red'),
   yref.lty = c('dashed','dotted'),
   xref.col = c('green','orange'),
   padding = 3.5
 )
)
# use of settings
multiplot(
 x %>% metaplot(conc, ,subject, settings = list(ncol = 4, nrow = 3), gg = F),
 x %>% metaplot(conc, ,subject, settings = list(ncol = 4), padding = 4, gg = T)
)
multiplot(
 x %>% metaplot(conc, time,, subject, settings = list(ncol = 4, nrow = 3), gg = F),
 x %>% metaplot(conc, time,, subject, settings = list(ncol = 4), padding = 4,  gg = T)
)
multiplot(
 x %>% metaplot(conc, arm, site, settings = list(ncol = 1, nrow = 2), gg = F),
 x %>% metaplot(conc, arm, site, settings = list(ncol = 1), padding = 4,  gg = T)
)

#iso aesthetics
multiplot(
 x %>% metaplot(conc, ipred, iso = NA, gg = F),
 x %>% metaplot(conc, ipred, iso = NA, gg = T, padding = 4)
)
multiplot(
 x %>% metaplot(conc, ipred, iso = list(lty = 'dashed'), gg = F),
 x %>% metaplot(conc, ipred, iso = list(lty = 'dashed'), gg = T, padding = 4)
)

## End(No test)



