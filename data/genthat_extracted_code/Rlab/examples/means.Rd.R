library(Rlab)


### Name: means
### Title: Computes one-way and two-way means tables
### Aliases: means
### Keywords: univar

### ** Examples


# Create a data set with two factors (age and gender)
race<-data.frame(c(1.02,.99,1.11,1.30,1.09,1.26,1.21,1.19,1.30,1.45,1.34,1.49),
                 c('M','M','M','M','M','M','F','F','F','F','F','F'),
                 c('under 50','under 50','under 50','over 50','over 50','over 50',
                   'under 50','under 50','under 50','over 50','over 50','over 50'))
names(race)<-c("time","gender","age")


# Show mean times broken by age, gender and age & gender
means(race$time, race$age, race$gender)



