library(StMoMo)


### Name: lc
### Title: Create a Lee-Carter model
### Aliases: lc

### ** Examples


#sum(kt) = 0 and log link
LC1 <- lc()
LCfit1<-fit(LC1, data = EWMaleData, ages.fit = 55:89)
plot(LCfit1)

#kt[1] = 0 and log link
LC2 <- lc(const = "first")
LCfit2<-fit(LC2, data = EWMaleData, ages.fit = 55:89)
plot(LCfit2)

#kt[n] = 0 and logit link
LC3 <- lc("logit", "last")
LCfit3<-fit(LC3, data = EWMaleData, ages.fit = 55:89)
plot(LCfit3)




