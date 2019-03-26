library(freqparcoord)


### Name: smoothz
### Title: Smoothing functions.
### Aliases: smoothz smoothzpred knnreg knndens

### ** Examples


# programmers and engineers in Silicon Valley, 2000 census, age 25-65
data(prgeng)
pg <- prgeng
pg1 <- pg[pg$age >= 25 & pg$age <= 65,]
estreg <- smoothz(pg1[,c(1,8)],sf=knnreg,k=100)
age <- pg1[,1]
p <- ggplot(data.frame(age,estreg))
p + geom_smooth(aes(x=age,y=estreg))
# peak earnings appear to occur around age 45




