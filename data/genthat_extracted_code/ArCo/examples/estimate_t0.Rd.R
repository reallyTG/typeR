library(ArCo)


### Name: estimate_t0
### Title: Estimates the intervention time on a given treated unit
### Aliases: estimate_t0

### ** Examples

#############################
## === Example for q=1 === ##
#############################
data(data.q1) 
# = First unit was treated on t=51 by adding
# a constant equal to one standard deviation.

data=list(data.q1) # = Even if q=1 the data must be in a list

## == Fitting the ArCo using linear regression == ##

# = creating fn and p.fn function = #
fn=function(X,y){
    return(lm(y~X))
}
p.fn=function(model,newdata){
    b=coef(model)
    return(cbind(1,newdata)%*%b)
}

t0a=estimate_t0(data = data,fn = fn, p.fn = p.fn, treated.unit = 1 )


#############################
## === Example for q=2 === ##
#############################

# = First unit was treated on t=51 by adding constants of one standard deviation.
# for the first and second variables
data(data.q2) # data is already a list


t0b=estimate_t0(data = data.q2,fn = fn, p.fn = p.fn, treated.unit = 1, start=0.4)



