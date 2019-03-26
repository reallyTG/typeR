library(Rlab)


### Name: mplot
### Title: Plots factor means
### Aliases: mplot
### Keywords: hplot

### ** Examples


# Create a data set with three factors (age, gender and number of water breaks)
race<-data.frame(c(1.02,.99,1.11,1.30,1.09,1.26,1.21,1.19,1.30,1.45,1.34,1.49),
                 c('M','M','M','M','M','M','F','F','F','F','F','F'),
                 c('under 50','under 50','under 50','over 50','over 50','over 50',
                   'under 50','under 50','under 50','over 50','over 50','over 50'),
                 c(1,0,2,2,0,1,2,1,0,2,1,0))
names(race)<-c("time","gender","age","water")


# Show mean times broken by age, gender and age & gender
mplot(race$time, race$age, race$gender)

# Show 2 plots, with age and then gender along the x-axis
mplot(race$time, race$age, race$gender, both=TRUE)

# Now also consider water breaks
mplot(race$time, race$age, race$gender, race$water, both=TRUE)

# Print the means for the above plots
means(race$time, race$age, race$gender, race$water)




