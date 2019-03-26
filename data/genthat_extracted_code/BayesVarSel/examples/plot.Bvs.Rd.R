library(BayesVarSel)


### Name: plot.Bvs
### Title: A function for plotting summaries of an object of class 'Bvs'
### Aliases: plot.Bvs

### ** Examples



#Analysis of Crime Data
#load data
data(UScrime)

#Default arguments are Robust prior for the regression parameters
#and constant prior over the model space
#Here we keep the 1000 most probable models a posteriori:
crime.Bvs<- Bvs(formula= y ~ ., data=UScrime, n.keep=1000)

#A look at the results:
crime.Bvs

summary(crime.Bvs)

#A plot with the posterior probabilities of the dimension of the
#true model:
plot(crime.Bvs, option="dimension")

#An image plot of the joint inclusion probabilities:
plot(crime.Bvs, option="joint")

#Two image plots of the conditional inclusion probabilities:
plot(crime.Bvs, option="conditional")
plot(crime.Bvs, option="not")





