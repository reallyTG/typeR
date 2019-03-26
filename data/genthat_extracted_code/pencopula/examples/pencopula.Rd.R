library(pencopula)


### Name: pencopula
### Title: Calculating penalized copula density with penalized hierarchical
###   B-splines
### Aliases: pencopula
### Keywords: nonparametric

### ** Examples

require(MASS)
data(Lufthansa)
data(DeutscheBank)

data.dbank <- data.lufth <- c()

dim.data <- dim(DeutscheBank)[1]

for(i in 2:dim.data) data.dbank[i-1] <- log(DeutscheBank[i,2]/DeutscheBank[i-1,2])
for(i in 2:dim.data) data.lufth[i-1] <- log(Lufthansa[i,2]/Lufthansa[i-1,2])

dbank1 <- fitdistr(data.dbank,"t")
lufth1 <- fitdistr(data.lufth,"t")

mypt <- function(x, m, s, df) pt((x-m)/s, df)

Y <- cbind(mypt(data.dbank,dbank1$estimate[1],s=dbank1$estimate[2],df=dbank1$estimate[3]),
mypt(data.lufth,lufth1$estimate[1],s=lufth1$estimate[2],df=lufth1$estimate[3]))

cop <- pencopula(Y,d=4,D=4,lambda=rep(10,2))




