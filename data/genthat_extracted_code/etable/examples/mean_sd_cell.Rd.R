library(etable)


### Name: mean_sd_cell
### Title: Mean and SD Cell FUN
### Aliases: mean_sd_cell
### Keywords: mean sd

### ** Examples

sex     <- factor(rbinom(1000, 1, 0.4),  labels=c('Men', 'Women'))
height  <- rnorm(1000, mean=1.66, sd=0.1)
height[which(sex=='Men')]<-height[which(sex=='Men')]+0.1
weight  <- rnorm(1000, mean=70, sd=5)
decades <- rbinom(1000, 3, 0.5)
decades <- factor(decades, labels=c('[35,45)','[45,55)','[55,65)','[65,75)'))
d<-data.frame(sex, decades, height, weight)
tabular.ade(x_vars=c('height', 'weight'), xname=c('Height [m]','Weight [kg]'),
   rows=c('sex','ALL'), rnames=c('Gender'),
   cols=c('decades'),   cnames=c('Age decades'),
   data=d, FUN=mean_sd_cell, style=2, nsd=1.96)



