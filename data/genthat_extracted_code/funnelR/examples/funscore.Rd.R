library(funnelR)


### Name: funscore
### Title: Score Proportion Data
### Aliases: funscore

### ** Examples

#My sample data
my_data  <- data.frame(id=c('A','B','C','D','E'), n=c(2,5,10,15,18), d=c(20,20,20,20,20))

#Score sample data
my_scoredata <- funscore(my_data, alpha=0.95, alpha2=0.998, method='approximate')

#View scored data
head(my_scoredata)



