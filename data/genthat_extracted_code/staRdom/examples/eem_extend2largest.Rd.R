library(staRdom)


### Name: eem_extend2largest
### Title: EEM sample data is extended to include all wavelengths in all
###   samples
### Aliases: eem_extend2largest

### ** Examples

library(dplyr)
data(eem_list)
eem_list <- eem_exclude(eem_list[1:5] %>%
`class<-`("eemlist"), exclude = list(em = c(318,322,326,550,438), ex = c(270,275))) %>%
eem_bind(eem_list[6:15] %>% `class<-`("eemlist"))
ggeem(eem_list)

eem_extend2largest(eem_list) %>%
  ggeem()



