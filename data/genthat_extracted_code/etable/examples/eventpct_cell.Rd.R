library(etable)


### Name: eventpct_cell
### Title: Factor level frequencies Cell FUN.
### Aliases: eventpct_cell
### Keywords: percentages frequency

### ** Examples

sex     <- factor(rbinom(1000, 1, 0.4), labels=c('Men', 'Women'))
event   <- factor(rbinom(1000, 1, 0.1), labels=c('no',  'yes'))
decades <- rbinom(1000, 3, 0.5)
decades <- factor(decades, labels=c('[35,45)','[45,55)','[55,65)','[65,75)'))
d<-data.frame(sex, decades, event)
tabular.ade(x_vars=c('event'), xname=c('Event'),
   rows=c('sex','ALL'), rnames=c('Gender'),
   cols=c('decades', 'ALL'),   cnames=c('Age decades'),
   data=d, FUN=eventpct_cell)



