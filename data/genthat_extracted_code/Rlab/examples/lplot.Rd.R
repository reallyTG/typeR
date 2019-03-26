library(Rlab)


### Name: lplot
### Title: Label plot
### Aliases: lplot
### Keywords: hplot

### ** Examples

# Create some Normal data
set.seed(123)
temp<- data.frame(matrix(rnorm(12*8), ncol=12))
pos<- c(1:6,9:14)
lplot(temp)

# Now see some labels
lplot(temp, labels=paste("Y",1:12), tcex=.5)


# Create a data set with two factors (age and gender)
race<-data.frame(c(1.02,.99,1.11,1.30,1.09,1.26,1.21,1.19,1.30,1.45,1.34,1.49),
                 c('M','M','M','M','M','M','F','F','F','F','F','F'),
                 c('under 50','under 50','under 50','over 50','over 50','over 50',
                   'under 50','under 50','under 50','over 50','over 50','over 50'))
names(race)<-c("time","gender","age")

# Plot the data to see the factors
lplot(race$gender, race$time, race$age)



