library(anoint)


### Name: anoint
### Title: Create analysis of interactions object
### Aliases: anoint anoint-class

### ** Examples


# NO INTERACTION CONDITION, LOGISTIC MODEL

null.interaction <- data.anoint(
                             alpha = c(log(.5),log(.5*.75)),
                             beta = log(c(1.5,2)),
                             gamma = rep(1,2),
                             mean = c(0,0),
                             vcov = diag(2),
                             type="survival", n = 500
                             )

head(null.interaction)

object <- anoint(Surv(y, event)~(V1+V2)*trt,data=null.interaction,family="coxph")

object

summary(object)

# NO INTERACTION CONDITION, WITH PROGNOSTIC SELECTION

null.interaction <- data.anoint(
                             alpha = c(log(.2/.8),log(.2*.75/(1-.2*.75))),
                             beta = c(1.5,2,0,0),
                             gamma = rep(1,4),
                             mean = rep(0,4),
                             vcov = diag(4),
                             type="binomial", n = 500
                             )

head(null.interaction)

object <- anoint(y~(V1+V2+V3+V4)*trt,data=null.interaction,select="glmnet")

summary(object)

# FORCE V1, V2 INTO THE MODEL; INTERCEPT IS ALWAYS THE FIRST TERM OF MODEL
object <- anoint(y~(V1+V2+V3+V4)*trt,data=null.interaction,
			select="glmnet",keep.vars=c("V1","V2"))

summary(object)

# SELECTION WITH STEPWISE SELECTION AND AIC CRITERION
object <- anoint(y~(V1+V2+V3+V4)*trt,data=null.interaction,
			select="stepAIC")

summary(object)




