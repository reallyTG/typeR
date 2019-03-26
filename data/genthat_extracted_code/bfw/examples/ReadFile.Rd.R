library(bfw)


### Name: ReadFile
### Title: Read File
### Aliases: ReadFile

### ** Examples

# Print JAGS model for bernoulli trials
cat(ReadFile("stats_bernoulli"))
# model {
#   for (i in 1:n){
#     x[i] ~ dbern(theta)
#   }
#   theta ~ dunif(0,1)
# }



