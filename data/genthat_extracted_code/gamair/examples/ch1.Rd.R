library(gamair)


### Name: ch1
### Title: Code for Chapter 1: Linear Models
### Aliases: ch1

### ** Examples

library(gamair); library(mgcv)

## 1.1.2
data(hubble)
hub.mod <- lm(y ~ x - 1, data=hubble)
summary(hub.mod)
plot(fitted(hub.mod),residuals(hub.mod),xlab="fitted values",
     ylab="residuals")
hub.mod1 <- lm(y ~ x - 1,data=hubble[-c(3,15),])
summary(hub.mod1)
plot(fitted(hub.mod1),residuals(hub.mod1),
     xlab="fitted values",ylab="residuals")
hubble.const <- c(coef(hub.mod),coef(hub.mod1))/3.09e19
age <- 1/hubble.const
age/(60^2*24*365)

## 1.1.3
cs.hubble <- 163000000
t.stat <- (coef(hub.mod1)-cs.hubble)/vcov(hub.mod1)[1,1]^0.5
pt(t.stat,df=21)*2 # 2 because of |T| in p-value defn.

sigb <- summary(hub.mod1)$coefficients[2]
h.ci <- coef(hub.mod1)+qt(c(0.025,0.975),df=21)*sigb
h.ci
h.ci <- h.ci*60^2*24*365.25/3.09e19 # convert to 1/years
sort(1/h.ci)

## 1.5.1
data(sperm.comp1)
pairs(sperm.comp1[,-1])
sc.mod1 <- lm(count~time.ipc+prop.partner,sperm.comp1)
model.matrix(sc.mod1)
par(mfrow=c(2,2))  # split the graphics device into 4 panels
plot(sc.mod1)      # (uses plot.lm as sc.mod1 is class `lm')
sperm.comp1[9,]
sc.mod1
sc.mod2 <- lm(count~time.ipc+I(prop.partner*time.ipc),
              sperm.comp1)

## 1.5.2
summary(sc.mod1)

## 1.5.3
sc.mod3 <- lm(count~prop.partner,sperm.comp1)
summary(sc.mod3)
sc.mod4 <- lm(count~1,sperm.comp1) # null model
AIC(sc.mod1,sc.mod3,sc.mod4)

## 1.5.4
data(sperm.comp2)
sc2.mod1 <- lm(count~f.age+f.height+f.weight+m.age+m.height+
               m.weight+m.vol,sperm.comp2)
plot(sc2.mod1)
summary(sc2.mod1)
sc2.mod2 <- lm(count~f.age+f.height+f.weight+m.height+
               m.weight+m.vol,sperm.comp2)
summary(sc2.mod2)
sc2.mod7 <- lm(count~f.weight,sperm.comp2)
summary(sc2.mod7)
sc <- sperm.comp2[-19,]
sc3.mod1 <- lm(count~f.age+f.height+f.weight+m.age+m.height+
               m.weight+m.vol,sc)
summary(sc3.mod1)
sperm.comp1$m.vol <-
   sperm.comp2$m.vol[sperm.comp2$pair%in%sperm.comp1$subject]
sc1.mod1 <- lm(count~m.vol,sperm.comp1)
summary(sc1.mod1)

## 1.5.5
sc.c <- summary(sc1.mod1)$coefficients
sc.c   # check info extracted from summary
sc.c[2,1]+qt(c(.025,.975),6)*sc.c[2,2]

## 1.5.6
df <- data.frame(m.vol=c(10,15,20,25))
predict(sc1.mod1,df,se=TRUE)

## 1.5.7
set.seed(1); n <- 100; x <- runif(n)
z <- x + rnorm(n)*.05
y <- 2 + 3 * x + rnorm(n)
summary(lm(y~z))
summary(lm(y~x+z))

## 1.6.4
z <- c(1,1,1,2,2,1,3,3,3,3,4)
z
z <- as.factor(z)
z
x <- c("A","A","C","C","C","er","er")
x
x <- factor(x)
x
PlantGrowth$group
# PlantGrowth$group <- as.factor(PlantGrowth$group)
pgm.1 <- lm(weight ~ group,data=PlantGrowth)
plot(pgm.1)
summary(pgm.1)
pgm.0 <- lm(weight~1,data=PlantGrowth)
anova(pgm.0,pgm.1)




