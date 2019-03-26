library(erer)


### Name: daIns
### Title: Liability Insurance Coverage for Hunters and Anglers in
###   Mississippi
### Aliases: daIns
### Keywords: datasets

### ** Examples

data(daIns)
class(daIns); dim(daIns)
head(daIns); tail(daIns)

ra <- glm(formula = Y ~ Injury + HuntYrs + Nonres +
                    Lspman + Lnong + Gender + Age +
                    Race + Marital + Edu + Inc + TownPop,
          family = binomial(link="logit"),
          data = daIns, x = TRUE, y= TRUE)
names(ra); summary(ra)

(ins.me <- maBina(w = ra))
(ins.mt <- maTrend(q=ins.me, nam.c="Age", nam.d="Nonres"))
plot(ins.mt)



