## ---- include=FALSE------------------------------------------------------
if(!require(RBesT)) {
    ## in case RBesT is not yet installed, please
    ## install RBesT from CRAN
    install.packages("RBesT")
    ## and also ensure that required packages are available
    install.packages(c("bayesplot", "knitr", "dplyr", "purrr", "ggplot2"))
}
library(RBesT)
library(knitr)
library(bayesplot)
library(dplyr)
library(purrr)
library(ggplot2)
theme_set(theme_bw())
knitr::opts_chunk$set(
    fig.width = 1.62*4,
    fig.height = 4,
    cache=TRUE
)
## setup up fast sampling when run on CRAN
is_CRAN <- !identical(Sys.getenv("NOT_CRAN"), "true")
## NOTE: for running this vignette locally, please uncomment the
## following line:
## is_CRAN <- FALSE
if (is_CRAN) {
    options(RBesT.MC.warmup=250, RBesT.MC.iter=500, RBesT.MC.chains=2)
}

## ------------------------------------------------------------------------
trials <- data.frame(study  = c("PoC", "PhII", "PhIII_A", "PhIII_B"),
                     deaths = c(    8,     85,       162,       150),
                     HR     = c(  0.7,   0.75,      0.83,      0.78),
                     stringsAsFactors = FALSE
                     )
## under the normal approximation of the log-HR, the sampling sd is 2
## such that the standard errors are sqrt(4/events)
trials <- trials %>%
    mutate(logHR=log(HR), sem=sqrt(4/deaths))
kable(trials, digits=2)

## ------------------------------------------------------------------------
Nev <- 379

alt_HR <- 0.75
alt_logHR <- log(alt_HR)

alpha <- 0.025

## ------------------------------------------------------------------------
unit_inf <- mixnorm(c(1, 0, 1), sigma=2, param="mn")
unit_inf

## ------------------------------------------------------------------------
success_crit <- decision1S(1-alpha, 0)
## let's print the defined criterion
success_crit
design <- oc1S(unit_inf, Nev, success_crit, sigma=2)

## ------------------------------------------------------------------------
design(alt_logHR)

## ------------------------------------------------------------------------
power.t.test(n=Nev, delta=-1*alt_logHR, sd=2, type="one.sample", sig.level=0.025, alternative="one.sided")

## ------------------------------------------------------------------------
ggplot(data.frame(HR=c(0.5, 1.2)), aes(HR)) +
    stat_function(fun=compose(design, log)) +
    vline_at(c(alt_HR, 1.0), linetype=I(2)) +
    scale_y_continuous(breaks=seq(0,1,by=0.1)) +
    scale_x_continuous(breaks=c(alt_HR, seq(0,1.2,by=0.2))) +
    ylab(NULL) + xlab(expression(theta[a])) +
    ggtitle(paste("Power for N =", Nev, "events"))

## ------------------------------------------------------------------------
design_crit <- decision1S_boundary(unit_inf, Nev, success_crit, sigma=2)

design_crit
exp(design_crit)

## ------------------------------------------------------------------------
success_crit(postmix(unit_inf, m=design_crit, n=379))

## ------------------------------------------------------------------------
success_crit(postmix(unit_inf, m=design_crit+log(1.01), n=379))

## ------------------------------------------------------------------------
interim_A <- postmix(unit_inf, m=trials$logHR[3], se=trials$sem[3])
interim_A

## ------------------------------------------------------------------------
interim_pos_A <- pos1S(interim_A, Nev-trials$deaths[3], success_crit, sigma=2)

## ------------------------------------------------------------------------
interim_pos_A(interim_A)

## ------------------------------------------------------------------------
interim_oc_A <- oc1S(interim_A, Nev-trials$deaths[3], success_crit, sigma=2)

## ------------------------------------------------------------------------
interim_oc_A(alt_logHR)

## ------------------------------------------------------------------------
interim_pos_A(mixnorm(c(1, alt_logHR, 1E-4)))

## ------------------------------------------------------------------------
interim_B <- postmix(unit_inf, m=trials$logHR[4], se=trials$sem[4])
interim_pos_B <- pos1S(interim_B, Nev-trials$deaths[4], success_crit, sigma=2)
interim_pos_B(interim_B)

## ------------------------------------------------------------------------
base <- trials[1:2,]

set.seed(342345)
base_map_mc <- gMAP(cbind(logHR, sem) ~ 1 | study,
                    family=gaussian,
                    data=base,
                    weights=deaths,
                    tau.dist="HalfNormal", tau.prior=0.5,
                    beta.prior=cbind(0, 2))

forest_plot(base_map_mc, est="MAP")

base_map <- automixfit(base_map_mc)

plot(base_map)$mix + xlab(expression(log(theta)))

base_map

## ------------------------------------------------------------------------
interim_A_combined <- postmix(base_map, m=trials$logHR[3], se=trials$sem[3])

## ------------------------------------------------------------------------
interim_pos_A(interim_A_combined)

## ------------------------------------------------------------------------
interim_B_combined <- postmix(base_map, m=trials$logHR[4], se=trials$sem[4])
interim_pos_B(interim_B_combined)

## ------------------------------------------------------------------------
interim_map_mc <- update(base_map_mc, data=trials)

## ------------------------------------------------------------------------
kable(fitted(interim_map_mc), digits=3)

## ------------------------------------------------------------------------
interim_map_post <- as.matrix(interim_map_mc)[,1:4]

dim(interim_map_post) # posterior is given as matrix: iteration x parameter

head(interim_map_post, n=3)

## ------------------------------------------------------------------------
interim_A_allcombined <- automixfit(interim_map_post[,"theta[3]"])

## ------------------------------------------------------------------------
interim_pos_A(interim_A_allcombined)

## ------------------------------------------------------------------------
interim_B_allcombined <- automixfit(interim_map_post[,"theta[4]"])
interim_pos_B(interim_B_allcombined)

## ------------------------------------------------------------------------
trials <- trials %>% mutate(stratum=c(2, 2, 1, 1))

kable(trials, digits=2)

set.seed(435345)
interim_diff_map_mc <- gMAP(cbind(logHR, sem) ~ 1 | study,
                            tau.strata=stratum,
                            family=gaussian,
                            data=trials,
                            weights=deaths,
                            tau.dist="HalfNormal", tau.prior=c(0.5, 1),
                            beta.prior=cbind(0, 2))

interim_diff_map_post <- as.matrix(interim_diff_map_mc)[,1:4]

interim_A_diff_allcombined <- automixfit(interim_diff_map_post[,"theta[3]"])
interim_B_diff_allcombined <- automixfit(interim_diff_map_post[,"theta[4]"])

interim_pos_A(interim_A_diff_allcombined)
interim_pos_B(interim_B_diff_allcombined)

## ------------------------------------------------------------------------
interim_pos_A(interim_A)

## ------------------------------------------------------------------------
interim_oc_A <- oc1S(interim_A, Nev-trials$deaths[3], success_crit, sigma=2)

## ------------------------------------------------------------------------
interim_A_samp <- rmix(interim_A, 1E4)
mean(interim_oc_A(interim_A_samp))

## ------------------------------------------------------------------------
interim_oc_B <- oc1S(interim_B, Nev-trials$deaths[4], success_crit, sigma=2)

## ------------------------------------------------------------------------
mean(interim_oc_A(interim_diff_map_post[,"theta[3]"]) * interim_oc_B(interim_diff_map_post[,"theta[4]"]))

## ------------------------------------------------------------------------
interim_pos_A(interim_A) * interim_pos_B(interim_B)

## ------------------------------------------------------------------------
cor(interim_diff_map_post[,c("theta[3]", "theta[4]")])

## ------------------------------------------------------------------------
mean(interim_oc_A(interim_map_post[,"theta[3]"]) * interim_oc_B(interim_map_post[,"theta[4]"]))

## ------------------------------------------------------------------------
## only interim data of trial A 
interim_pos_A(interim_A)
## in addition with prior historical data PoC & phase II data
interim_pos_A(interim_A_combined)
## finally with the interim data of the phase III B
interim_pos_A(interim_A_allcombined)

## ------------------------------------------------------------------------
## only interim data of trial B
interim_pos_B(interim_B)
## in addition with prior historical data PoC & phase II data
interim_pos_B(interim_B_combined)
## finally with the interim data of the phase III A
interim_pos_B(interim_B_allcombined)

## ------------------------------------------------------------------------
base_map_mc_2 <- gMAP(cbind(logHR, sem) ~ 1 | study,
                      family=gaussian,
                      data=base,
                      weights=deaths,
                      tau.dist="HalfNormal", tau.prior=0.5,
                      beta.prior=cbind(0, 2),
                      chains=ifelse(is_CRAN, 2, 20))

## ------------------------------------------------------------------------
base_map_2 <- mixfit(base_map_mc_2, Nc=5)
base_map_2

## ------------------------------------------------------------------------
interim_A_combined_2 <- postmix(base_map_2, m=trials$logHR[3], se=trials$sem[3])

## ------------------------------------------------------------------------
interim_map_mc_2 <- update(base_map_mc_2, data=trials[-4,])

interim_map_post_2 <- as.matrix(interim_map_mc_2)[,1:3]

## ------------------------------------------------------------------------
interim_A_allcombined_2 <- mixfit(interim_map_post_2[,"theta[3]"], Nc=5)

interim_A_allcombined_2

## ------------------------------------------------------------------------
ggplot(data.frame(logHR=c(-0.8,0.25)), aes(logHR)) +
    stat_function(fun=dmix, args=list(mix=interim_A_combined_2), aes(linetype="MAP")) +
    stat_function(fun=dmix, args=list(mix=interim_A_allcombined_2), aes(linetype="MAC")) +
    scale_linetype_discrete("Analysis") +
    ggtitle("Posterior log hazard of phase III A trial at interim")

## ------------------------------------------------------------------------
interim_pos_A(interim_A_combined_2)
interim_pos_A(interim_A_allcombined_2)

## ------------------------------------------------------------------------
sessionInfo()

