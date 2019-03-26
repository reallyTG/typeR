library(etable)


### Name: miss_cell
### Title: missing values Cell FUN
### Aliases: miss_cell
### Keywords: missings

### ** Examples

sex     <- factor(rbinom(1000, 1, 0.4),  labels=c('Men', 'Women'))
height  <- rnorm(1000, mean=1.66, sd=0.1)
height[which(sex=='Men')]<-height[which(sex=='Men')]+0.1
weight  <- rnorm(1000, mean=70, sd=5)
decades <- rbinom(1000, 3, 0.5)
decades <- factor(decades, labels=c('[35,45)','[45,55)','[55,65)','[65,75)'))
d<-data.frame(sex, decades, height, weight)
d$height[round(runif(250,1,1000))]<- NA
d$weight[round(runif(25 ,1,1000))]<- NA
tabular.ade(x_vars=c('height', 'weight'), xname=c('Height [m]','Weight [kg]'),
        cols=c('sex','decades','ALL'), cnames=c('Gender', 'Age decades'),
        data=d, FUN=miss_cell, prefix='Miss:')



