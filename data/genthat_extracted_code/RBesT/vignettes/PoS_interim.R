## ----init, include=FALSE-------------------------------------------------
library(ggplot2)
library(scales)
library(knitr)
library(dplyr)
library(RBesT)
theme_set(theme_bw())
knitr::opts_chunk$set(
    fig.width = 1.62*4,
    fig.height = 4
)

## ----ia data summary-----------------------------------------------------
ia <- data.frame(n=c(12, 14),
                 median_count=c(20.5, 21),
                 mean_count=c(23.3, 27),
                 mean_log=c(2.96, 3.03),
                 sd_log=c(0.67, 0.774),
                 row.names=c("active", "placebo")) %>%
    transform(se_log=round(sd_log/sqrt(n), 3))
sd_log_pooled <- with(ia, sqrt(sum(sd_log^2*(n-1))/(sum(n)-2)))
kable(ia)

## ----rules, eval=TRUE----------------------------------------------------
n <- 21 # planned total n per arm
rules <- decision2S(c(0.9, 0.5), c(0,-0.357), lower.tail = TRUE)
print(rules)

## ----rules2, echo=FALSE, eval=TRUE---------------------------------------
rule1 <- decision2S(0.9, 0, lower.tail = TRUE)
rule2 <- decision2S(0.5, -0.357, lower.tail = TRUE)

## ----ia------------------------------------------------------------------
priorP <- priorT <- mixnorm(c(1, log(20), 1), sigma = 0.47, param = 'mn')
## posterior at IA data
postT_interim <- postmix(priorT, m=ia["active","mean_log"], se=ia["active","se_log"])
postP_interim <- postmix(priorP, m=ia["placebo","mean_log"], se=ia["placebo","se_log"])
pmixdiff(postT_interim, postP_interim, 0)
pmixdiff(postT_interim, postP_interim,-0.357)

## ----pp------------------------------------------------------------------
pos_final <- pos2S(
  postT_interim,
  postP_interim,
  n - ia["active","n"],
  n - ia["placebo","n"],
  rules,
  sigma1 = sd_log_pooled,
  sigma2 = sd_log_pooled
  )

## ----ppout---------------------------------------------------------------
pos_final(postT_interim, postP_interim)

## ----oc, fig.height=4,fig.width=4*1.62-----------------------------------
ia_oc <- oc2S(
    postT_interim,
    postP_interim,
    n - ia["active","n"],
    n - ia["placebo","n"],
    rules,
    sigma1 = sd_log_pooled,
    sigma2 = sd_log_pooled
    )
  
delta <- seq(0, 0.9, 0.01) #pct diff from pbo
pbomean <- ia["placebo","mean_log"]
y1 <- log(exp(pbomean) * (1 - delta)) #active
y2 <- log(exp(pbomean) * (1 - 0 * delta)) #placebo
  
out <-
    data.frame(
        diff_pct = delta,
        diff = round(y1 - y2, 2),
        y_act = y1,
        y_pbo = y2,
        cp = ia_oc(y1, y2)
        )
  
ggplot(data = out, aes(x = diff_pct, y = cp)) + geom_line() +
    scale_x_continuous(labels = scales::percent) +
        labs(y = 'Conditional power',
             x = 'True percentage difference from placebo in lesion count',
             title = 'Conditional power at interim for success at final analysis')

## ----session, echo=FALSE, eval=TRUE--------------------------------------
sessionInfo()

