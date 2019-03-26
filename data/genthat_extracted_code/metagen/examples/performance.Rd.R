library(metagen)


### Name: performance
### Title: Running a computer experiment
### Aliases: performance

### ** Examples

h_test <- 0.03
x_test <- cbind(1,1:7)
b_test <- c(.5, .25)
sgnf_test <- c(0.025, 0.01)

set.seed(5133568) # for reproducibility
d_test <- rchisq(7, df=0.02)

# In an actual computer experiment, use 'piv_draws=1000' instead!!
eY <- experimentY(n=5, h=h_test, d=d_test, x=x_test, b=b_test,
  sgnf=sgnf_test, piv_draws=50)

performance(results=eY, b=b_test, h=h_test)



