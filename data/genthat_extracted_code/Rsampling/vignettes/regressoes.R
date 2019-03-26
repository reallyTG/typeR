## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
    collapse=TRUE,
    comment = NA,
    prompt = TRUE
    )
set.seed(42)

## ----installation CRAN, eval=FALSE---------------------------------------
#  install.packages("Rsampling")

## ----installation, eval=FALSE--------------------------------------------
#  library(devtools)
#  install_github(repo = 'lageIBUSP/Rsampling')

## ----load library--------------------------------------------------------
library(Rsampling)

## ----inspecionando objeto rhyzophora-------------------------------------
head(rhyzophora)
summary(rhyzophora)

## ----plot rhyzophora, fig.cap = "Relação entre o número de raízes de sustentação e razão área da copa / área do tronco em árvores de mangue em solos mais e menos instáveis."----
plot(n.roots ~ canopy.trunk, data=rhyzophora, type="n",
     xlab="área copa / área tronco", ylab="número de raízes")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="medium")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="high", pch=19)
legend("topright", c("Média","Alta"), title="Instabilidade do solo", pch=c(1,19))

## ----estatistica de interesse rhyzophora---------------------------------
rhyz.ei <- function(dataframe){
    m1 <- lm(n.roots ~ canopy.trunk, data=dataframe,
             subset=soil.instability=="medium")
    m2 <- lm(n.roots ~ canopy.trunk, data=dataframe,
             subset=soil.instability=="high")
    c(med = coef(m1)[[2]],
      high = coef(m2)[[2]])
}
## Valore observados
rhyz.ei(rhyzophora)

## ----rhyzophora resampling, results="hide"-------------------------------
rhyz.r <- Rsampling(type = "normal_rand", dataframe = rhyzophora,
                    statistics = rhyz.ei, stratum = rhyzophora$soil.instability,
                        cols = 2, ntrials = 1000)

## ----rhyzophora resampling results---------------------------------------
rhyz.r[,1:3]

## ----rhyzophora distribuicao nula, fig.cap="Distribuição das inclinações da regressão linear do número de raízes em função da razão das áreas da copa e tronco, em 1000 simulações da hipótese nula de ausência de relação. As linhas vermelhas indicam as inclinações observadas. A região de aceitação da hipótese nula a 5% está em cinza. Em laranja o número de valores da distribuição nula maiores que os observados.", fig.width=7.5----
par(mfrow=c(1,2))
dplot(rhyz.r[1,], svalue=rhyz.ei(rhyzophora)[1], pside="Greater",
      main="Média instabilidade", xlab="Inclinações sob H0")
dplot(rhyz.r[2,], svalue=rhyz.ei(rhyzophora)[2], pside="Greater",
      main="Alta instabilidade", xlab="Inclinações sob H0")
par(mfrow=c(1,1))

## ----rhyzophora teste----------------------------------------------------
sum(rhyz.r[1,] >= rhyz.ei(rhyzophora)[1])/1000 < 0.05
sum(rhyz.r[2,] >= rhyz.ei(rhyzophora)[2])/1000 < 0.05

## ----segunda estatistica de interesse rhyzophora-------------------------
rhyz.ei2 <- function(dataframe){
    m1 <- lm(n.roots ~ canopy.trunk, data=dataframe,
             subset=soil.instability=="medium")
    m2 <- lm(n.roots ~ canopy.trunk, data=dataframe,
             subset=soil.instability=="high")
    coef(m1)[[2]] - coef(m2)[[2]]
}
## Valores observados
rhyz.ei2(rhyzophora)

## ----rhyzophora resampling inclinação, results="hide"--------------------
rhyz.r2 <- Rsampling(type = "normal_rand", dataframe = rhyzophora,
                    statistics = rhyz.ei2,
                        cols = 1, ntrials = 1000)

## ----rhyzophora 2nd teste------------------------------------------------
sum(rhyz.r2 > rhyz.ei2(rhyzophora))/1000 < 0.05

## ----inclinação comum rhyzophora-----------------------------------------
lm(n.roots ~ canopy.trunk, data=rhyzophora)

## ----plot rhyzophora single regression, fig.cap = "Relação entre o número de raízes de sustentação e razão área da copa / área do tronco em árvores de mangue em solos mais e menos instáveis. A reta é a regressão linear ajustada a todos os pontos."----
plot(n.roots ~ canopy.trunk, data=rhyzophora, type="n",
     xlab="área copa / área tronco", ylab="número de raízes")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="medium")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="high", pch=19)
abline(lm(n.roots ~ canopy.trunk, data=rhyzophora))
legend("topright", c("Média","Alta"), title="Instabilidade do solo", pch=c(1,19))

## ----terceiraestatistica de interesse rhyzophora-------------------------
rhyz.ei3 <- function(dataframe){
    m1 <- lm(n.roots ~ canopy.trunk, data=dataframe)
    res.media <- tapply(resid(m1), dataframe$soil.instability, mean)
    res.media[[1]] - res.media[[2]]
}
## Valores observados
rhyz.ei3(rhyzophora)

## ----rhyzophora resampling intercepto, results="hide"--------------------
rhyz.r3 <- Rsampling(type = "normal_rand", dataframe = rhyzophora,
                    statistics = rhyz.ei3,
                        cols = 1, ntrials = 1000)

## ----rhyzophora 3rd teste------------------------------------------------
sum(rhyz.r3 > rhyz.ei3(rhyzophora))/1000 < 0.05

## ----rhyzophora ancova---------------------------------------------------
(rhyz.ancova <- lm(n.roots ~ soil.instability + canopy.trunk  -1,
                   data=rhyzophora))

## ----plot rhyzophora ancova, fig.cap = "Relação entre o número de raízes de sustentação e razão área da copa / área do tronco em árvores de mangue em solos mais e menos instáveis. As retas são regressões lineares de mesma inclinação mas interceptos diferentes para cada tipo de solo."----
cfs <- coef(rhyz.ancova)
plot(n.roots ~ canopy.trunk, data=rhyzophora, type="n",
     xlab="área copa / área tronco", ylab="número de raízes")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="medium", col="blue")
points(n.roots ~ canopy.trunk, data=rhyzophora,
       subset=soil.instability=="high", col="red")
abline(cfs[1],cfs[3], col="red")
abline(cfs[2],cfs[3], col="blue")
legend("topright", c("Média","Alta"), title="Instabilidade do solo", col=c("blue", "red"))

