library(etable)


### Name: mode_cell
### Title: Mode Cell FUN
### Aliases: mode_cell
### Keywords: mode frequency

### ** Examples

sex     <- factor(rbinom(1000, 1, 0.4),  labels=c('Men', 'Women'))
note    <- as.factor(rbinom(1000, 4, 0.5)+1)
decades <- rbinom(1000, 3, 0.5)
decades <- factor(decades, labels=c('[35,45)','[45,55)','[55,65)','[65,75)'))
d<-data.frame(sex, decades, note)
tabular.ade(x_vars=c('note'), xname=c('Noten'),
       rows=c('sex','ALL','decades'), rnames=c('Gender', 'Age decades'),
       data=d, FUN=mode_cell)



