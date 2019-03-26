library(score)


### Name: ipaq
### Title: Scores 'International Physical Activity Questionnaire (IPAQ)'
### Aliases: ipaq
### Keywords: IPAQ

### ** Examples

## Generating a random IPAQ data for illustration
set.seed(1234)
n <- 20
ID <- rep(1:n)
weight <- rtnorm(n, mean=75, sd=15, lower=40, upper=120)
VigDays <- sample(rep(0:2),n,replace=TRUE)
VigHours <- sample(rep(0:1),n,replace=TRUE)
VigMin <- sample(rep(0:60),n,replace=TRUE)
VigHours <- ifelse(VigDays==0,0,VigHours)
VigMin <- ifelse(VigDays==0,0,VigMin)
ModDays <- sample(rep(0:3),n,replace=TRUE)
ModHours <- sample(rep(0:2),n,replace=TRUE)
ModMin <- sample(rep(0:60),n,replace=TRUE)
ModHours <- ifelse(ModDays==0,0,ModHours)
ModMin <- ifelse(ModDays==0,0,ModMin)
WalkDays <- sample(rep(0:7),n,replace=TRUE)
WalkHours <- sample(rep(0:2),n,replace=TRUE)
WalkMin <- sample(rep(0:60),n,replace=TRUE)
WalkHours <- ifelse(WalkDays==0,0,WalkHours)
WalkMin <- ifelse(WalkDays==0,0,WalkMin)
SitHours <- sample(rep(1:14),n,replace=TRUE)
SitMin <- sample(rep(1:60),n,replace=TRUE)

sampleIPAQ <- data.frame(ID, weight, 
                         VigDays, VigHours, VigMin,
                         ModDays, ModHours, ModMin,
                         WalkDays, WalkHours, WalkMin,
                         SitHours, SitMin)

# Now scoring the data
output <- ipaq(ipaqdata=sampleIPAQ)



