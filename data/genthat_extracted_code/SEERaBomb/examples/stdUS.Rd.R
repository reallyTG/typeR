library(SEERaBomb)


### Name: stdUS
### Title: The standard population of the US in 2000
### Aliases: stdUS
### Keywords: datasets

### ** Examples

library(SEERaBomb)
with(stdUS,plot(age,pop/1e6,type="l",xlab="Age",
     ylab="People (Millions)",main="US Population in 2000"))
library(dplyr)
stdUS%>%filter(age>=85)%>%summarize(weighted.mean(age,w=pop)) 
### so ave age >=85.0 is 89.4



