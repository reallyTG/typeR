library(verification)


### Name: discrimination.plot
### Title: Discrimination plot
### Aliases: discrimination.plot
### Keywords: file

### ** Examples

 #  A sample forecast.  

data(disc.dat)
discrimination.plot(disc.dat$group.id, disc.dat$frcst, main = "Default  Plot")

discrimination.plot(disc.dat$group.id, disc.dat$frcst, main = "New Labels", cex = 1.2,
leg.txt = c("Low", "Med", "High" ) )

discrimination.plot(disc.dat$group.id, disc.dat$frcst, main = "Without Marginal Plots ",
marginal = FALSE)


 


