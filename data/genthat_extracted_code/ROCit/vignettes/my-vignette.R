## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----ROC1, echo=FALSE,fig.width=6,fig.height=4,fig.cap="ROC curves example"----
library(ROCit)
class=c(rep(1,50), rep(0,50))
set.seed(1)
score=c(rnorm(50,50,10), rnorm(50,34,10))
r1=rocit(score, class, method = "bin")
set.seed(1)
score=c(rnorm(50,50,10), rnorm(50,39,10))
r2=rocit(score, class, method = "bin")
set.seed(1)
score=c(rnorm(50,50,10), rnorm(50,44,10))
r3=rocit(score, class, method = "bin")



plot(r1$TPR~r1$FPR, type = "l", xlab = "1 - Specificity (FPR)", lwd = 2,
     ylab = "Sensitivity (TPR)", col= "gold4")
grid()
lines(r2$TPR~r2$FPR, lwd = 2, col = "dodgerblue4")
lines(r3$TPR~r3$FPR, lwd = 2, col = "orange")
abline(0,1, col = 2, lwd = 2)
segments(0,0,0,1, col = "darkgreen", lwd = 2)
segments(1,1,0,1, col = "darkgreen", lwd = 2)
arrows( 0.3, 0.4, 0.13, 0.9, length = 0.25, angle = 30,
       code = 2, lwd = 2)
text(0.075, 0.88, "better")


legend("bottomright", c("Perfectly Separable", 
                        "ROC 1", "ROC 2", "ROC 3", "Chance Line"), 
       lwd = 2, col = c("darkgreen", "gold4", "dodgerblue4",
                        "orange", "red"), bty = "n")

## ----ch1-----------------------------------------------------------------
library(ROCit)
data("Loan")

# check the class variable
summary(Loan$Status)
class(Loan$Status)

## ----ch2-----------------------------------------------------------------
Simple_Y <- convertclass(x = Loan$Status, reference = "FP") 

# charged off rate
mean(Simple_Y)

## ----ch3-----------------------------------------------------------------
mean(convertclass(x = Loan$Status))

## ----ch4, fig.height=4, fig.width=6,fig.cap="Accuracy vs Cutoff"---------
data("Diabetes")
logistic.model <- glm(as.factor(dtest)~chol+age+bmi,
                      data = Diabetes,family = "binomial")
class <- logistic.model$y
score <- logistic.model$fitted.values
# -------------------------------------------------------------
measure <- measureit(score = score, class = class,
                     measure = c("ACC", "SENS", "FSCR"))
names(measure)
plot(measure$ACC~measure$Cutoff, type = "l")

## ----ch5-----------------------------------------------------------------
data("Diabetes")
summary(Diabetes$dtest)
summary(as.factor(Diabetes$dtest))

## ----ch6-----------------------------------------------------------------
roc_empirical <- rocit(score = Diabetes$chol, class = Diabetes$dtest,
                       negref = "-") 

## ----ch7-----------------------------------------------------------------
class(roc_empirical)
methods(class="rocit")

## ----ch8-----------------------------------------------------------------
summary(roc_empirical)
# function returns
names(roc_empirical)
# -------
message("Number of positive responses used: ", roc_empirical$pos_count)
message("Number of negative responses used: ", roc_empirical$neg_count)

## ----ch11----------------------------------------------------------------
head(cbind(Cutoff=roc_empirical$Cutoff, 
                 TPR=roc_empirical$TPR, 
                 FPR=roc_empirical$FPR))

tail(cbind(Cutoff=roc_empirical$Cutoff, 
                 TPR=roc_empirical$TPR, 
                 FPR=roc_empirical$FPR))

## ----ch12----------------------------------------------------------------
roc_binormal <- rocit(score = Diabetes$chol, 
                      class = Diabetes$dtest,
                      negref = "-", 
                      method = "bin") 


roc_nonparametric <- rocit(score = Diabetes$chol, 
                           class = Diabetes$dtest,
                           negref = "-", 
                           method = "non") 

summary(roc_binormal)
summary(roc_nonparametric)

## ----ch13, fig.width=6,fig.height=4--------------------------------------
# Default plot
plot(roc_empirical, values = F)


# Changing color
plot(roc_binormal, YIndex = F, 
     values = F, col = c(2,4))


# Other options
plot(roc_nonparametric, YIndex = F, 
     values = F, legend = F)

## ----ch14, fig.width=6,fig.height=4--------------------------------------
## first, fit a logistic model
logistic.model <- glm(as.factor(dtest)~
                        chol+age+bmi,
                        data = Diabetes,
                        family = "binomial")

## make the score and class
class <- logistic.model$y
# score = log odds
score <- logit(logistic.model$fitted.values)

## rocit object
rocit_emp <- rocit(score = score, 
                   class = class, 
                   method = "emp")
rocit_bin <- rocit(score = score, 
                   class = class, 
                   method = "bin")
rocit_non <- rocit(score = score, 
                   class = class, 
                   method = "non")

summary(rocit_emp)
summary(rocit_bin)
summary(rocit_non)

## Plot ROC curve
plot(rocit_emp, col = c(1,"gray50"), 
     legend = FALSE, YIndex = FALSE)
lines(rocit_bin$TPR~rocit_bin$FPR, 
      col = 2, lwd = 2)
lines(rocit_non$TPR~rocit_non$FPR, 
      col = 4, lwd = 2)
legend("bottomright", col = c(1,2,4),
       c("Empirical ROC", "Binormal ROC",
         "Non-parametric ROC"), lwd = 2)

## ----ch15----------------------------------------------------------------
# Default 
ciAUC(rocit_emp)
ciAUC(rocit_emp, level = 0.9)

# DeLong method
ciAUC(rocit_bin, delong = TRUE)


# logit and inverse logit applied
ciAUC(rocit_bin, delong = TRUE,
      logit = TRUE)


# bootstrap method
set.seed(200)
ciAUC_boot <- ciAUC(rocit_non, 
                level = 0.9, nboot = 200)
print(ciAUC_boot)

## ----ch16, fig.width=6,fig.height=4,fig.cap="Empirical ROC curve with 90% CI"----
data("Loan")
score <- Loan$Score
class <- ifelse(Loan$Status == "CO", 1, 0)
rocit_emp <- rocit(score = score, 
                   class = class, 
                   method = "emp")
rocit_bin <- rocit(score = score, 
                   class = class, 
                   method = "bin")
# --------------------------
ciROC_emp90 <- ciROC(rocit_emp, 
                     level = 0.9)
set.seed(200)
ciROC_bin90 <- ciROC(rocit_bin, 
                     level = 0.9, nboot = 200)
plot(ciROC_emp90, col = 1, 
     legend = FALSE)
lines(ciROC_bin90$TPR~ciROC_bin90$FPR, 
      col = 2, lwd = 2)
lines(ciROC_bin90$LowerTPR~ciROC_bin90$FPR, 
      col = 2, lty = 2)
lines(ciROC_bin90$UpperTPR~ciROC_bin90$FPR, 
      col = 2, lty = 2)
legend("bottomright", c("Empirical ROC",
                        "Binormal ROC",
                        "90% CI (Empirical)", 
                        "90% CI (Binormal)"),
       lty = c(1,1,2,2), col = 
         c(1,2,1,2), lwd = c(2,2,1,1))

## ----ch17----------------------------------------------------------------
class(ciROC_emp90)

## ----ch18, fig.height=4, fig.width=6, fig.cap="KS plot"------------------
data("Diabetes")
logistic.model <- glm(as.factor(dtest)~
                      chol+age+bmi,
                      data = Diabetes,
                      family = "binomial")
class <- logistic.model$y
score <- logistic.model$fitted.values
# ------------
rocit <- rocit(score = score, 
               class = class) #default: empirical
kplot <- ksplot(rocit)

## ----ch19----------------------------------------------------------------
message("KS Stat (empirical) : ", 
        kplot$`KS stat`)
message("KS Stat (empirical) cutoff : ", 
        kplot$`KS Cutoff`)

## ----ch20----------------------------------------------------------------
data("Loan")
class <- Loan$Status
score <- Loan$Score
# ----------------------------
gtable15 <- gainstable(score = score, 
                       class = class,
                       negref = "FP", 
                       ngroup = 15)


## ----ch21----------------------------------------------------------------
rocit_emp <- rocit(score = score, 
                   class = class, 
                   negref = "FP")
gtable_custom <- gainstable(rocit_emp, 
                    breaks = seq(1,100,15))
# ------------------------------
print(gtable15)
print(gtable_custom)

## ----ch22, fig.height=4, fig.width=6, fig.cap="Lift and Cum. Lift plot"----
plot(gtable15, type = 1)

