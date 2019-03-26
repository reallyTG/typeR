library(depmix)


### Name: generate
### Title: Generate data from a dependent mixture model
### Aliases: generate
### Keywords: datagen

### ** Examples


# create a 2 state model with one continuous and one binary response
# with start values provided in st
st <- c(1,0.9,0.1,0.2,0.8,2,1,0.7,0.3,5,2,0.2,0.8,0.5,0.5)
mod <- dmm(nsta=2,itemt=c(1,2), stval=st)

# generate two series of lengths 100 and 50 respectively using above model
gen<-generate(c(100,50),mod)

summary(gen)
plot(gen)




