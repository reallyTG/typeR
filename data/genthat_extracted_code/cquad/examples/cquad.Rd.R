library(cquad)


### Name: cquad
### Title: Interface for functions fitting different versions of cquad
### Aliases: cquad
### Keywords: panel data

### ** Examples

# example based on simulated data
data(data_sim)
data_sim = data_sim[1:500,]   # to speed up the example, remove otherwise
# basic (static) model
out1 = cquad(y~X1+X2,data_sim,100)
summary(out1)
# basic (dynamic) model
out2 = cquad(y~X1+X2,data_sim,100,dyn=TRUE)
summary(out2)
# equal model
out3 = cquad(y~X1+X2,data_sim,100,model="equal")
summary(out3)
# extended model
out4 = cquad(y~X1+X2,data_sim,100,model="extended")
summary(out4)
# psuedo CML for dynamic model
out5 = cquad(y~X1+X2,data_sim,100,model="pseudo")
summary(out5)



