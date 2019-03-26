library(BSDA)


### Name: Presiden
### Title: Ages at inauguration and death of U.S. presidents
### Aliases: Presiden
### Keywords: datasets

### ** Examples


pie(xtabs(~birth_state, data = Presiden))
stem(Presiden$inaugural_age)
stem(Presiden$death_age)
par(mar = c(5.1, 4.1 + 3, 4.1, 2.1))
stripchart(x=list(Presiden$inaugural_age, Presiden$death_age), 
           method = "stack", col = c("green","brown"), pch = 19, las = 1)
par(mar = c(5.1, 4.1, 4.1, 2.1)) 




