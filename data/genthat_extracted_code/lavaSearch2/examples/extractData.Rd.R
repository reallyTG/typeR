library(lavaSearch2)


### Name: extractData
### Title: Extract Data From a Model
### Aliases: extractData extractData.lm extractData.coxph extractData.cph
###   extractData.lvmfit extractData.gls extractData.lme

### ** Examples

set.seed(10)
n <- 101

#### linear regression ####
Y1 <- rnorm(n, mean = 0)
Y2 <- rnorm(n, mean = 0.3)
Id <- findInterval(runif(n), seq(0.1,1,0.1))
data.df <- rbind(data.frame(Y=Y1,G="1",Id = Id),
           data.frame(Y=Y2,G="2",Id = Id)
           )
m.lm <- lm(Y ~ G, data = data.df)
a <- extractData(m.lm, design.matrix = TRUE)
b <- extractData(m.lm, design.matrix = FALSE)

library(nlme)
m.gls <- gls(Y ~ G, weights = varIdent(form = ~ 1|Id), data = data.df)
c <- extractData(m.gls)
m.lme <- lme(Y ~ G, random = ~ 1|Id, data = data.df)
d <- extractData(m.lme)

library(lava)
e.lvm <- estimate(lvm(Y ~ G), data = data.df)
e <- extractData(e.lvm)
e <- extractData(e.lvm, design.matrix = TRUE)

#### survival #### 
library(survival)

## Not run: 
##D   library(riskRegression) ## needs version >=1.4.3
##D   dt.surv <- sampleData(n, outcome = "survival")
##D   m.cox <- coxph(Surv(time, event) ~ X1 + X2, data = dt.surv, x = TRUE, y = TRUE)
##D   f <- extractData(m.cox, design.matrix = FALSE)
##D   f <- extractData(m.cox, design.matrix = TRUE)
##D   m.cox <- coxph(Surv(time, event) ~ strata(X1) + X2, data = dt.surv, x = TRUE, y = TRUE)
##D   f <- extractData(m.cox, design.matrix = TRUE)
## End(Not run)

#### nested fuuctions ####
fct1 <- function(m){
   fct2(m)
}
fct2 <- function(m){ 
   extractData(m)
}
g <- fct1(m.gls)



