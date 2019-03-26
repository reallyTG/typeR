library(easyalluvial)


### Name: plot_condensation
### Title: Plot dataframe condensation potential
### Aliases: plot_condensation

### ** Examples


 require(magrittr)
 require(dplyr)

 df = mtcars %>%
   mutate( cyl = as.factor(cyl)
          , gear = as.factor(gear)
          , vs = as.factor(vs)
          , am = as.factor(am))

 plot_condensation(df)

 plot_condensation(df, first = 'disp')




