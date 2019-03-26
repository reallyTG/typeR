library(DOS)


### Name: angristlavy
### Title: Class Size and Academic Performance - Maimonidies Rule
### Aliases: angristlavy
### Keywords: datasets

### ** Examples

# Figure 1.1 in Chapter 1 of Design of Observational Studies (2010)
data(angristlavy)
attach(angristlavy)
grp<-factor(z,levels=c(1,0),labels=c("31-40","41-50"),ordered=TRUE)
par(mfrow=c(2,2))
boxplot(tipuach~grp,main="Disadvantaged",ylab="Percent")
boxplot(clasz~grp,main="Class Size",ylab="Students")
boxplot(avgmath~grp,main="Math",ylab="Average Score")
boxplot(avgverb~grp,main="Verbal",ylab="Average Score")
detach(angristlavy)



