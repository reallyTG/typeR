library(Rlab)


### Name: mfit
### Title: Computes main and interaction fitted effects
### Aliases: mfit
### Keywords: univar

### ** Examples


# Create a data set with two factors (age and gender)
race<-data.frame(c(1.02,.99,1.11,1.30,1.09,1.26,1.21,1.19,1.30,1.45,1.34,1.49),
                 c('M','M','M','M','M','M','F','F','F','F','F','F'),
                 c('under 50','under 50','under 50','over 50','over 50','over 50',
                   'under 50','under 50','under 50','over 50','over 50','over 50'))
names(race)<-c("time","gender","age")


# Show fitted effects for age, gender and age & gender
means(race$time, race$age, race$gender)



