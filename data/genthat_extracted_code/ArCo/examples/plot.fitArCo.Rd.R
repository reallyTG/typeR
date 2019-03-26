library(ArCo)


### Name: plot.fitArCo
### Title: Plots realized values and the counterfactual estimated by the
###   fitArCo function
### Aliases: plot.fitArCo

### ** Examples

##############################################
## === Example based on the q=1 fitArCo === ##
##############################################
# = First unit was treated on t=51 by adding
# a constant equal to one standard deviation
data(data.q1)
data=list(data.q1) # = Even if q=1 the data must be in a list
## == Fitting the ArCo using linear regression == ##
# = creating fn and p.fn function = #
fn=function(X,y){
return(lm(y~X))
}
p.fn=function(model,newdata){
b=coef(model)
return(cbind(1,newdata) %*% b)}
ArCo=fitArCo(data = data,fn = fn, p.fn = p.fn, treated.unit = 1 , t0 = 51)
plot(ArCo)



