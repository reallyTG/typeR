## ---- setup, include = FALSE---------------------------------------------
# Some customization.  
pacman::p_load(corpcor, splines, irlba, mnormt, fdrtool)
options(digits = 3, show.signif.stars = FALSE)
knitr::opts_chunk$set(
  tidy = FALSE,     # display code as typed
  size = "small",   # slightly smaller font for code
  comment = "",
  cache = TRUE,
  message = FALSE,
  warning = FALSE)

## ----functions, include=FALSE--------------------------------------------
# A function for captioning and referencing images
fig <- local({
    i <- 0
    ref <- list()
    list(
        cap=function(refName, text) {
            i <<- i + 1
            ref[[refName]] <<- i
            paste("Figure ", i, ": ", text, sep="")
        },
        ref=function(refName) {
            ref[[refName]]
        })
})

## ----eval = FALSE--------------------------------------------------------
#  install.packages("ERP")

## ----eval = TRUE, message = FALSE, warning = FALSE-----------------------
library(ERP)

## ----eval = TRUE---------------------------------------------------------
data(impulsivity)
dim(impulsivity)

## ----eval = TRUE---------------------------------------------------------
knitr::kable(head(impulsivity[, 1:8]))

## ----eval = TRUE---------------------------------------------------------
time_pt <- seq(from = 0, to = 1000, by = 2)  
T <- length(time_pt)                 
n <- nrow(impulsivity)               
impulsivity$Subject <- factor(impulsivity$Subject,
          levels(impulsivity$Subject)[c(1, 9, 20:24, 2:8, 10:19)])
impulsivity$Channel <- factor(impulsivity$Channel,
          levels(impulsivity$Channel)[c(3,2,1)])

## ----eval = TRUE---------------------------------------------------------
covariates <- impulsivity[, 1:4] 
erpdta <- impulsivity[, -(1:4)]  

## ----eval = TRUE---------------------------------------------------------
with(covariates, table(Channel, Condition, Group))

## ----eval = TRUE---------------------------------------------------------
channels <- levels(covariates$Channel)  
groups <- levels(covariates$Group)      
colors <- ifelse(covariates$Condition == "Success", "orange", "slateblue") 

## ----eval = TRUE, fig.cap = paste("Fig. 1: Successful (oragne) and failed (slate blue) inhibition ERP curves at FCZ, CZ and CPZ for high and low impulsivity groups.")----
par(mfrow = c(3, 2)) 
for (i in 1:3) {
 for (j in 1:2) {
  select <- (covariates$Channel == channels[i]) & 
            (covariates$Group == groups[j]) 
  erpplot(erpdta[select, ], frames = time_pt, col = colors[select], 
          lty = 1, lwd = 2, cex.lab = 1.25,
          xlab = "Time (ms)", ylab = "ERP (mV)",  
          main = paste("Channel: ", channels[i], " - Group: ", groups[j], 
                       sep = ""))
 }
}
legend("topright", bty = "n", lwd = 2, col = c("orange", "slateblue"),  
       legend = c("Success", "Failure")) 
par(mfrow = c(1, 1))

## ----eval = TRUE---------------------------------------------------------
design <- model.matrix(~ C(Subject, sum)/Group + Group + Condition + 
                         Channel + Channel:Condition + Channel:Group +
                         Condition:Group + Channel:Condition:Group, 
                         data = covariates)

## ----eval = TRUE---------------------------------------------------------
colnames(design)[c(1, 23:27)]

## ----eval = TRUE, fig.cap = paste("Fig. 2: Difference ERP curve between response inhibition conditions at FCZ for high impulsivity group")----
erpplot(erpdta, design, effect = 26, interval = "simultaneous", 
        nbs = 20, lwd = 2, frames = time_pt, 
        xlab = "Time (ms)", ylab = "Condition effect")
title("Success-Failure difference curve \n Group High, Channel FCZ")

## ----eval = TRUE, fig.cap = paste("Fig.3: Success-Failure difference curve by group for three channels")----
par(mfrow = c(3, 2)) 
for (i in 1:3) {
 for (j in 1:2) {
  covariates$Channel <- relevel(covariates$Channel,ref = channels[i])
  covariates$Group <- relevel(covariates$Group,ref = groups[j])
  design <- model.matrix(~ C(Subject, sum)/Group + Group + Condition +
                            Channel + Channel:Condition + Channel:Group + 
                            Condition:Group + Channel:Condition:Group,
                            data = covariates)
  erpplot(erpdta, design, effect = 26, interval = "simultaneous", 
          nbs = 20, lwd = 2, frames = time_pt, ylim = c(-6, 6),
          xlab = "Time (ms)", ylab = "Condition effect")
  title(paste("Group ", groups[j], " Channel ", channels[i], sep = ""))
  }
}
par(mfrow = c(1, 1)) 

## ----eval = TRUE---------------------------------------------------------
design0 <- model.matrix( ~ C(Subject, sum)/Group + Group + Condition + 
                           Channel + Channel:Condition + Channel:Group + 
                           Condition:Group, data = covariates)

## ----eval = TRUE, fig.cap = paste("Fig. 4: Variance Inflation Curve - Diagnostic plot to determine the number of factors in correlation-adjusted testing procedures.")----
F <- erpFtest(erpdta, design, design0, nbf = NULL, pvalue = "none", 
              wantplot = TRUE)

## ------------------------------------------------------------------------
F$nbf

## ----eval = TRUE---------------------------------------------------------
erpFtest(erpdta, design, design0, nbf = F$nbf)$pval 

## ----eval = TRUE---------------------------------------------------------
design <- model.matrix(~ C(Subject, sum)/Group + Group + Condition + 
                         Channel + Channel:Condition + Channel:Group +
                         Condition:Group, data = covariates)

## ----eval=TRUE-----------------------------------------------------------
design0 <- model.matrix(~ C(Subject, sum)/Group + Group + Condition + 
                          Channel + Channel:Group + Condition:Group, 
                          data = covariates)
erpFtest(erpdta, design, design0, nbf = F$nbf)$pval  

## ------------------------------------------------------------------------
design0 <- model.matrix(~ C(Subject, sum)/Group + Group + Condition + 
                          Channel + Channel:Condition + Condition:Group, 
                          data = covariates)
erpFtest(erpdta, design, design0, nbf = F$nbf)$pval  

## ------------------------------------------------------------------------
design0 <- model.matrix(~ C(Subject, sum)/Group + Group + Condition + 
                          Channel + Channel:Condition + Channel:Group, 
                          data = covariates)
erpFtest(erpdta, design, design0, nbf = F$nbf)$pval 

## ----eval = TRUE---------------------------------------------------------
design <- model.matrix(~ C(Subject, sum)/Group + Group + Condition + 
                         Channel + Condition:Group, data = covariates)

## ----eval = TRUE---------------------------------------------------------
design0 <- model.matrix(~ C(Subject, sum)/Group + Group + Condition +
                          Condition:Group, data = covariates)
erpFtest(erpdta, design, design0, nbf = F$nbf)$pval  

## ----eval = TRUE, fig.cap = paste("Fig. 5: Success-Failure difference curve by group")----
par(mfrow = c(2,1)) 
for (i in 1:2) {
 covariates$Group <- relevel(covariates$Group, ref = groups[i])
 design <- model.matrix(~ C(Subject, sum)/Group + Group + Condition + 
                          Channel + Condition:Group, data = covariates)
 erpplot(erpdta, design, effect = 26, interval = "simultaneous", 
         lwd = 2, frames = time_pt, ylim = c(-6, 6),
         xlab = "Time (ms)", ylab = "Condition effect")
 title(paste("Success-Failure difference curve \n Group ",
             groups[i], sep = ""))
}
par(mfrow = c(1, 1)) 

## ----eval = TRUE---------------------------------------------------------
impulsivity.hcpz <- subset(impulsivity, 
                           (impulsivity$Channel == "CPZ") &
                           (impulsivity$Group == "High"))
impulsivity.hcpz <- droplevels(impulsivity.hcpz)
covariates.hcpz <- impulsivity.hcpz[, 1:4] 
erpdta.hcpz <- impulsivity.hcpz[, -(1:4)]  

## ----eval = TRUE---------------------------------------------------------
design <- model.matrix(~ C(Subject, sum) + Condition, data = covariates.hcpz)
design0 <- model.matrix(~ C(Subject, sum), data = covariates.hcpz)

## ----eval = TRUE---------------------------------------------------------
avetest <- erpavetest(erpdta.hcpz, design, design0)

## ----eval=TRUE,fig.cap=paste("Fig. 6: Fitted 'Condition' effect curve at channel CPZ for high impulsivity group with significant intervals identified by 'erpavetest'.")----
erpplot(erpdta.hcpz, design, effect = ncol(design), lwd = 2, 
        interval = "simultaneous", frames = time_pt, ylim = c(-6, 6),
        xlab = "Time (ms)", ylab = "Condition effect")
title("Success-Failure difference curve \n Group High, Channel CPZ")
points(time_pt[avetest$significant], rep(0, length(avetest$significant)), 
       pch = 20, col = "goldenrod")
abline(v = time_pt[avetest$breaks], lty = 2, col = "darkgray")

## ----eval=TRUE-----------------------------------------------------------
bhtest <- erptest(erpdta.hcpz, design, design0)

## ----eval = TRUE, fig.cap = paste("Fig. 7: Fitted 'Condition' effect curve at channel CPZ for high impulsivity group with significant intervals identified by 'erptest'.")----
erpplot(erpdta.hcpz, design, effect = ncol(design), lwd = 2, 
        interval = "simultaneous", frames = time_pt, ylim = c(-6, 6),
        xlab = "Time (ms)", ylab = "Condition effect")
title("Success-Failure difference curve \n Group High, Channel CPZ")
points(time_pt[bhtest$significant], rep(0, length(bhtest$significant)),
       pch = 20, col = "goldenrod")

## ----eval = TRUE---------------------------------------------------------
gb <- gbtest(erpdta.hcpz, design, design0)

## ----eval = TRUE, fig.cap=paste("Fig. 8:Fitted 'Condition' effect curve at channel CPZ for high impulsivity group with significant intervals identified by 'gbtest'.")----
erpplot(erpdta.hcpz, design, effect = ncol(design), lwd = 2,
        interval = "simultaneous", frames = time_pt,  ylim = c(-6, 6),
        xlab = "Time (ms)", ylab = "Condition effect")
title("Success-Failure difference curve \n Group High, Channel CPZ")
points(time_pt[gb$significant], rep(0, length(gb$significant)),
       pch = 20, col = "goldenrod")

## ----eval = TRUE, fig.cap = paste("Fig. 10: Variance Inflation diagnostic plot to choose the number of factors in the AFA method")----
fabh <- erpfatest(erpdta.hcpz, design, design0, nbf = NULL, 
                  wantplot = TRUE)
nbf <- fabh$nbf

## ----eval = TRUE---------------------------------------------------------
fabh <- erpfatest(erpdta.hcpz, design, design0, nbf = nbf)

## ----eval=TRUE,fig.cap=paste("Fig. 11: Fitted 'Condition' effect curve at channel CPZ for high impulsivity group with significant intervals identified by 'erpfatest'.")----
erpplot(erpdta.hcpz, design, effect = ncol(design), lwd = 2, 
        interval = "simultaneous", frames = time_pt, ylim = c(-6, 6),
        xlab = "Time (ms)", ylab = "Condition effect curve")
title("Success-Failure difference curve \n Group High, Channel CPZ")
points(time_pt[fabh$significant], rep(0, length(fabh$significant)),
       pch = 20, col = "goldenrod")

