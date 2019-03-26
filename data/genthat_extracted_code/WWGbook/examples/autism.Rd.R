library(WWGbook)


### Name: autism
### Title: autism data in Chapter 6
### Aliases: autism
### Keywords: datasets

### ** Examples

attach(autism)
sicdegp.f <- factor(sicdegp)
age.f <- factor(age)
detach(autism)

# Add the new variables to a new data frame object.
autism.updated <- data.frame(autism, sicdegp.f, age.f)
dim(autism.updated)
names(autism.updated)




