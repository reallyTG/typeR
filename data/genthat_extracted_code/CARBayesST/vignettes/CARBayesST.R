### R code from vignette source 'CARBayesST.Rnw'

###################################################
### code chunk number 1: CARBayesST.Rnw:116-117
###################################################
options(prompt = "R>  ")


###################################################
### code chunk number 2: CARBayesST.Rnw:444-451
###################################################
n.space <- 20
N <- 20
x.easting <- 1:n.space
x.northing <- 1:n.space
Grid <- expand.grid(x.easting, x.northing)
K <- nrow(Grid)
N.all <- N * K


###################################################
### code chunk number 3: CARBayesST.Rnw:456-459
###################################################
distance <- as.matrix(dist(Grid))
W <- array(0, c(K,K))
W[distance==1] <- 1


###################################################
### code chunk number 4: CARBayesST.Rnw:466-469
###################################################
distance <- as.matrix(dist(1:N))
D <-array(0, c(N,N))
D[distance==1] <-1


###################################################
### code chunk number 5: CARBayesST.Rnw:474-475
###################################################
Q.W <- 0.8 * (diag(apply(W, 2, sum)) - W) + 0.2 * diag(rep(1,K))


###################################################
### code chunk number 6: CARBayesST.Rnw:480-485
###################################################
Q.W.inv <- solve(Q.W)
library("MASS")
phi <- mvrnorm(n = 1, mu = rep(0, K), Sigma = (0.01 * Q.W.inv))
phi <- phi - mean(phi)
phi.long <- rep(phi, N)


###################################################
### code chunk number 7: CARBayesST.Rnw:491-496
###################################################
Q.D <- 0.8 * (diag(apply(D, 2, sum)) - D) + 0.2 * diag(rep(1, N))
Q.D.inv <- solve(Q.D)
delta <- mvrnorm(n = 1, mu = rep(0, N), Sigma = (0.01 * Q.D.inv))
delta <- delta - mean(delta)
delta.long <- kronecker(delta, rep(1, K))


###################################################
### code chunk number 8: CARBayesST.Rnw:501-503
###################################################
x <- rnorm(n = N.all, mean = 0, sd = 1)
gamma <- rnorm(n = N.all, mean = 0, sd = sqrt(0.01))


###################################################
### code chunk number 9: CARBayesST.Rnw:508-514
###################################################
beta1 <- 0
beta2 <- 0.1
n <- rep(50, N.all)
LP <- beta1 + beta2 * x + phi.long + delta.long + gamma
theta.true <- exp(LP) / (1 + exp(LP))
Y <- rbinom(n = N.all, size = n, prob = theta.true)


###################################################
### code chunk number 10: CARBayesST.Rnw:652-656
###################################################
library("CARBayesdata")
library("sp")
data("GGHB.IG")
data("pollutionhealthdata")


###################################################
### code chunk number 11: CARBayesST.Rnw:662-663
###################################################
head(pollutionhealthdata)


###################################################
### code chunk number 12: CARBayesST.Rnw:669-676
###################################################
pollutionhealthdata$SMR <- pollutionhealthdata$observed / 
    pollutionhealthdata$expected
pollutionhealthdata$logSMR <- log(pollutionhealthdata$SMR)
par(pty="s", cex.axis=1.5, cex.lab=1.5)
pairs(pollutionhealthdata[ ,c(9, 5:7)], pch=19, cex=0.5, lower.panel=NULL, 
      panel=panel.smooth,
      labels=c("ln(SMR)", "PM10", "JSA", "Price (*100,000)"))


###################################################
### code chunk number 13: CARBayesST.Rnw:691-695
###################################################
library("dplyr")
SMR.av <- summarise(group_by(pollutionhealthdata,IG), SMR.mean = 
    mean(SMR))
GGHB.IG@data$SMR <- SMR.av$SMR.mean


###################################################
### code chunk number 14: CARBayesST.Rnw:702-704
###################################################
library(rgdal)
GGHB.IG <- spTransform(GGHB.IG, CRS("+proj=longlat +datum=WGS84 +no_defs"))


###################################################
### code chunk number 15: CARBayesST.Rnw:709-719
###################################################
library(leaflet)
colours <- colorNumeric(palette = "BuPu", domain = GGHB.IG@data$SMR)
map1 <- leaflet(data=GGHB.IG) %>% 
    addTiles() %>% 
    addPolygons(fillColor = ~colours(SMR), color="red", weight=1, 
                fillOpacity = 0.7) %>%
    addLegend(pal = colours, values = GGHB.IG@data$SMR, opacity = 1, 
                title="SMR") %>%
    addScaleBar(position="bottomleft")
map1


###################################################
### code chunk number 16: CARBayesST.Rnw:734-738
###################################################
library("spdep")
W.nb <- poly2nb(GGHB.IG, row.names = SMR.av$IG)
W.list <- nb2listw(W.nb, style = "B")
W <- nb2mat(W.nb, style = "B")


###################################################
### code chunk number 17: CARBayesST.Rnw:748-754
###################################################
formula <- observed ~ offset(log(expected)) + jsa + price + pm10
model1 <- glm(formula = formula, family = "quasipoisson", 
    data = pollutionhealthdata)
resid.glm <- residuals(model1)
summary(model1)$coefficients
summary(model1)$dispersion


###################################################
### code chunk number 18: CARBayesST.Rnw:759-760
###################################################
moran.mc(x = resid.glm[1:271], listw = W.list, nsim = 10000)


###################################################
### code chunk number 19: CARBayesST.Rnw:885-889
###################################################
library("CARBayesdata")
library("sp")
data("GGHB.IG")
data("salesdata")


###################################################
### code chunk number 20: CARBayesST.Rnw:895-899
###################################################
salesdata$salesprop <- salesdata$sales / salesdata$stock
boxplot(salesdata$salesprop ~ salesdata$year, range = 0, xlab = "Year", 
    ylab = "Property sales rate", 
    col = "darkseagreen", border = "navy")


###################################################
### code chunk number 21: CARBayesST.Rnw:912-916
###################################################
library("dplyr")
salesprop.av <- summarise(group_by(salesdata, IG), 
    salesprop.mean = mean(salesprop))
GGHB.IG@data$sales <- salesprop.av$salesprop.mean


###################################################
### code chunk number 22: CARBayesST.Rnw:921-934
###################################################
library(rgdal)
GGHB.IG <- spTransform(GGHB.IG, CRS("+proj=longlat +datum=WGS84 +no_defs"))

library(leaflet)
colours <- colorNumeric(palette = "BuPu", domain = GGHB.IG@data$sales)
map1 <- leaflet(data=GGHB.IG) %>% 
    addTiles() %>% 
    addPolygons(fillColor = ~colours(sales), color="red", weight=1, 
                fillOpacity = 0.7) %>%
    addLegend(pal = colours, values = GGHB.IG@data$sales, opacity = 1, 
                title="Sales") %>%
    addScaleBar(position="bottomleft")
map1


###################################################
### code chunk number 23: CARBayesST.Rnw:952-955
###################################################
library("spdep")
W.nb <- poly2nb(GGHB.IG, row.names = salesprop.av$salesprop.mean)
W <- nb2mat(W.nb, style = "B")


