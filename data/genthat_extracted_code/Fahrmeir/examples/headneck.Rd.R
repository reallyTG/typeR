library(Fahrmeir)


### Name: headneck
### Title: Head and Neck Cancer data
### Aliases: headneck
### Keywords: datasets

### ** Examples

str(headneck) 
summary(headneck)
with(headneck, {plot(month, atrisk, type="s");
                lines(month, deaths, type="s", col="red");
                lines(month, withdrawals, type="S", col="green")})



