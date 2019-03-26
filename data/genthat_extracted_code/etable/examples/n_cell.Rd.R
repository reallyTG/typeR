library(etable)


### Name: n_cell
### Title: Frequency Cell FUN
### Aliases: n_cell
### Keywords: percentages frequency

### ** Examples

sex     <- factor(rbinom(1000, 1, 0.4),  labels=c('Men', 'Women'))
decades <- rbinom(1000, 3, 0.5)
decades <- factor(decades, labels=c('[35,45)','[45,55)','[55,65)','[65,75)'))
d<-data.frame(sex, decades)
tabular.ade(x_var='sex',  rows=c('sex',     'ALL'), rnames=c('Gender'),
                          cols=c('decades', 'ALL'), cnames=c('Age decades'),
            data=d, FUN=n_cell, , type="all")



