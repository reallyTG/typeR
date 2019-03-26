## ---- message = FALSE----------------------------------------------------
library(scdhlm)

## ------------------------------------------------------------------------
data(Lambert)
Lambert_ES <- with(Lambert, effect_size_ABk(outcome = outcome, treatment = treatment, 
                                            id = case, phase = phase, time = time))
str(Lambert_ES)

## ------------------------------------------------------------------------
with(Lambert, effect_size_ABk(outcome = outcome, treatment = treatment, 
                              id = case, phase = phase, time = time, 
                              phi = 0.10))[c("delta_hat","V_delta_hat","nu")]

with(Lambert, effect_size_ABk(outcome = outcome, treatment = treatment, 
                              id = case, phase = phase, time = time, 
                              phi = 0.35))[c("delta_hat","V_delta_hat","nu")]

## ------------------------------------------------------------------------
data(Anglesea)
Anglesea_ES <- with(Anglesea, effect_size_ABk(outcome, condition, case, phase, session))
Anglesea_ES[c("delta_hat","V_delta_hat","nu")]

## ------------------------------------------------------------------------
data(Saddler)

quality_ES <- with(subset(Saddler, measure=="writing quality"), 
                   effect_size_MB(outcome, treatment, case, time))
complexity_ES <- with(subset(Saddler, measure=="T-unit length"), 
                      effect_size_MB(outcome, treatment, case, time))
construction_ES <- with(subset(Saddler, measure=="number of constructions"), 
                        effect_size_MB(outcome, treatment, case, time))

cbind(quality = unlist(quality_ES), 
      complexity = unlist(complexity_ES), 
      construction = unlist(construction_ES))[c("delta_hat","V_delta_hat","nu","phi","rho"),]

## ------------------------------------------------------------------------
quality_RML <- lme(fixed = outcome ~ treatment, 
                   random = ~ 1 | case, 
                   correlation = corAR1(0, ~ time | case), 
                   data = subset(Saddler, measure=="writing quality"))
summary(quality_RML)

## ------------------------------------------------------------------------
quality_ES_RML <- g_REML(quality_RML, p_const = c(0,1), 
                         r_const = c(1,0,1), returnModel=FALSE)
str(quality_ES_RML)

## ------------------------------------------------------------------------
data(Laski)

# Hedges, Pustejovsky, & Shadish (2013)
Laski_ES_HPS <- with(Laski, effect_size_MB(outcome, treatment, case, time))

# Pustejovsky, Hedges, & Shadish (2014)
Laski_RML <- lme(fixed = outcome ~ treatment,
                 random = ~ 1 | case, 
                 correlation = corAR1(0, ~ time | case), 
                 data = Laski)
summary(Laski_RML)
Laski_ES_RML <- g_REML(Laski_RML, p_const = c(0,1),
                       r_const = c(1,0,1), returnModel=FALSE)

# compare the estimates
cbind(HPS = with(Laski_ES_HPS, c(SMD = delta_hat, Variance = V_delta_hat, phi = phi, rho = rho, nu = nu)),
      RML = with(Laski_ES_RML, c(g_AB, V_g_AB, phi, Tau / (Tau + sigma_sq), nu)))

## ------------------------------------------------------------------------
Laski_RML2 <- lme(fixed = outcome ~ treatment,
                 random = ~ treatment | case, 
                 correlation = corAR1(0, ~ time | case), 
                 data = Laski)
summary(Laski_RML2)
anova(Laski_RML, Laski_RML2)

## ------------------------------------------------------------------------
Laski_ES_RML2 <- g_REML(Laski_RML2, p_const = c(0,1), 
                        r_const = c(1,0,1,0,0), returnModel=FALSE)
Laski_ES_RML2[c("g_AB","V_g_AB","phi","nu")]

## ---- message = FALSE, fig.width = 7, fig.height = 7---------------------
data(Schutte)
Schutte <- subset(Schutte, case != "Case 4")
Schutte$case <- factor(Schutte$case)

change <- data.frame(case=unique(Schutte$case),
                     phase.change = with(subset(Schutte, treatment== "treatment"), 
                                         tapply(week, case, min)) - 0.5)

library(ggplot2)
ggplot(Schutte, aes(week, fatigue, shape = treatment, color = treatment)) + 
  geom_point() + facet_wrap(~ case, ncol = 3) + 
  labs(color="Phase",shape="Phase", y ="Fatigue", x="Week") + 
  geom_vline(data = change, aes(xintercept=phase.change)) +
  theme_bw() + theme(legend.position = "bottom")

## ------------------------------------------------------------------------
# create time-by-trt interaction
Schutte$trt_week <- with(Schutte, 
                         unlist(tapply((treatment=="treatment") * week, 
                                        list(treatment,case), 
                                        function(x) x - min(x))) + (treatment=="treatment"))

# time-point constants
A <- 2
B <- 9
# center at follow-up time
Center <- B
Schutte$week <- Schutte$week - Center

## ----Model3--------------------------------------------------------------
hlm1 <- lme(fixed = fatigue ~ week + treatment + trt_week, 
            random = ~ 1 | case, 
            correlation = corAR1(0, ~ week | case),
            data = Schutte,
            method = "REML")
summary(hlm1)

## ------------------------------------------------------------------------
Schutte_g1 <- g_REML(m_fit = hlm1, p_const = c(0,0,1,B - A), r_const = c(1,0,1))
Schutte_g1[c("g_AB","V_g_AB","nu")]

## ----Model4--------------------------------------------------------------
hlm2 <- update(hlm1, random = ~ week | case, 
               control=lmeControl(msMaxIter = 50, apVar=FALSE, returnObject=TRUE))
summary(hlm2)
anova(hlm1, hlm2)

## ------------------------------------------------------------------------
Schutte_g2 <- g_REML(m_fit = hlm2, p_const = c(0,0,1, B - A), r_const = c(1,0,1,0,0))
Schutte_g2[c("g_AB","V_g_AB","nu")]

## ----Model5, warning = FALSE---------------------------------------------
hlm3 <- update(hlm2, random = ~ week + trt_week | case, 
               control=lmeControl(msMaxIter = 50, apVar=FALSE, returnObject=TRUE))
summary(hlm3)
anova(hlm2, hlm3)

## ------------------------------------------------------------------------
Schutte_g3 <- g_REML(m_fit = hlm3, p_const = c(0,0,1,B - A), r_const = c(1,0,1,0,0,0,0,0))

# compare effect size estimates
cbind(MB3 = unlist(Schutte_g1[c("g_AB","V_g_AB","nu")]), 
      MB4 = unlist(Schutte_g2[c("g_AB","V_g_AB","nu")]), 
      MB5 = unlist(Schutte_g3[c("g_AB","V_g_AB","nu")]))

