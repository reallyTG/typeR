library(SimTimeVar)


### Name: override_static
### Title: Override static variable
### Aliases: override_static

### ** Examples

# example with 10 subjects each with 3 observations
# generate sex in a way where it might vary within a subject
data = data.frame( id = rep(1:10, each=3),
                   male = rbinom( n=10*3, size=1, prob=0.5 ) )
override_static("male", "id", data, 3)



