library(etable)


### Name: stat_cell
### Title: Diverse statistics Cell FUN
### Aliases: stat_cell
### Keywords: frequency median mean mode quantile sd

### ** Examples

sex     <- factor(rbinom(1000, 1, 0.4),  labels=c('Men', 'Women'))
height  <- rnorm(1000, mean=1.66, sd=0.1)
height[which(sex=='Men')]<-height[which(sex=='Men')]+0.1
weight  <- rnorm(1000, mean=70, sd=5)
decades <- rbinom(1000, 3, 0.5)
decades <- factor(decades, labels=c('[35,45)','[45,55)','[55,65)','[65,75)'))
d<-data.frame(sex, decades, height, weight)
tabular.ade(x_vars=c('height', 'weight'), xname=c('Height [m]','Weight [kg]'),
   y_vars=c('N', 'MEAN', 'SD', 'SKEW', 'KURT'),
   rows=c('sex', 'ALL', 'decades', 'ALL'), rnames=c('Gender', 'Age decades'),
   data=d, FUN=stat_cell)



