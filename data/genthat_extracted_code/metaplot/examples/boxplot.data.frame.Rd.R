library(metaplot)


### Name: boxplot.data.frame
### Title: Boxplot Method for Data Frame
### Aliases: boxplot.data.frame

### ** Examples

library(dplyr)
library(magrittr)
Theoph %<>% mutate(site = ifelse(as.numeric(Subject) > 6, 'Site A','Site B'))
boxplot(Theoph,'Subject','conc')
boxplot(Theoph,Subject,conc)
boxplot(Theoph,Subject,conc, gg = T)
boxplot(Theoph,conc,Subject)
boxplot(Theoph,conc,Subject, gg = T)
boxplot(Theoph,conc,Subject,site)
boxplot(Theoph,conc,Subject,site, gg = T)
boxplot(Theoph,conc,Subject,site, gg = T, scales = 'free_x')
attr(Theoph,'title') <- 'Theophylline'
boxplot(Theoph, Subject, conc, main = function(x,...)attr(x,'title'))
boxplot(Theoph, Subject, conc, main = function(x,...)attr(x,'title'), gg = T)
boxplot(Theoph, Subject, conc, sub= function(x,...)attr(x,'title'))
boxplot(Theoph, Subject, conc, sub= function(x,...)attr(x,'title'), gg = T)
boxplot(Theoph %>% filter(conc > 0),Subject,conc, log = T)
boxplot(Theoph %>% filter(conc > 0),Subject,conc, log = T, gg = T)



