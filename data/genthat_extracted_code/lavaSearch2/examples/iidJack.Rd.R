library(lavaSearch2)


### Name: iidJack
### Title: Jackknife iid Decomposition from Model Object
### Aliases: iidJack iidJack.default

### ** Examples

n <- 20

#### glm ####
set.seed(10)
m <- lvm(y~x+z)
distribution(m, ~y+z) <- binomial.lvm("logit")
d <- lava::sim(m,n)
g <- glm(y~x+z,data=d,family="binomial")
iid1 <- iidJack(g, cpus = 1)
iid2 <- lava::iid(g)
quantile(iid1-iid2)
vcov(g)
colSums(iid2^2)
colSums(iid1^2)

#### Cox model ####
## Not run: 
##D library(survival)
##D data(Melanoma, package = "riskRegression")
##D m <- coxph(Surv(time,status==1)~ici+age, data = Melanoma, x = TRUE, y = TRUE)
##D 
##D ## require riskRegression > 1.4.3
##D if(utils::packageVersion("riskRegression") > "1.4.3"){
##D library(riskRegression)
##D iid1 <- iidJack(m)
##D iid2 <- iidCox(m)$IFbeta
##D 
##D apply(iid1,2,sd)
##D 
##D print(iid2)
##D 
##D apply(iid2,2,sd)
##D   }
## End(Not run)

#### LVM ####
## Not run: 
##D set.seed(10)
##D 
##D mSim <- lvm(c(Y1,Y2,Y3,Y4,Y5) ~ 1*eta)
##D latent(mSim) <- ~eta
##D categorical(mSim, K=2) <- ~G
##D transform(mSim, Id ~ eta) <- function(x){1:NROW(x)}
##D dW <- lava::sim(mSim, n, latent = FALSE)
##D dL <- reshape2::melt(dW, id.vars = c("G","Id"),
##D                      variable.name = "time", value.name = "Y")
##D dL$time <- gsub("Y","",dL$time)
##D 
##D m1 <- lvm(c(Y1,Y2,Y3,Y4,Y5) ~ 1*eta)
##D latent(m1) <- ~eta
##D regression(m1) <- eta ~ G
##D e <- estimate(m1, data = dW)
##D 
##D iid1 <- iidJack(e)
##D iid2 <- iid(e)
##D attr(iid2, "bread") <- NULL
##D 
##D apply(iid1,2,sd)
##D apply(iid2,2,sd)
##D quantile(iid2 - iid1)
## End(Not run)

#### lme ####
## Not run: 
##D library(nlme)
##D e2 <- lme(Y~G+time, random = ~1|Id, weights = varIdent(form =~ 1|Id), data = dL)
##D e2 <- lme(Y~G, random = ~1|Id, data = dL)
##D 
##D iid3 <- iidJack(e2)
##D apply(iid3,2,sd)
## End(Not run)




