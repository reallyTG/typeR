library(BaPreStoPro)


### Name: Virkler
### Title: Crack Growth
### Aliases: Virkler
### Keywords: datasets

### ** Examples

data(Virkler)

Y <- t(Virkler[,-1]/10000)
t <- Virkler[,1]

plot(t, Y[1,], type = 'l', ylim = range(Y), xlab = "crack length in mm", 
   ylab = "time in load cycles / 10000")
for (i in 2:nrow(Y)){
 lines(t, Y[i,])
}




