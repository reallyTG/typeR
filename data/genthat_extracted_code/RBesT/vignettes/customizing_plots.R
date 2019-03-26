## ----setup, include=FALSE------------------------------------------------
suppressPackageStartupMessages(library(tidyverse))
library(knitr)
knitr::opts_chunk$set(echo = TRUE, warning=FALSE, message=FALSE, fig.width = 1.62*4, fig.height = 4)
## setup up fast sampling when run on CRAN
if (!identical(Sys.getenv("NOT_CRAN"), "true")) {
    options(RBesT.MC.warmup=250, RBesT.MC.iter=500, RBesT.MC.chains=2)
}

## ------------------------------------------------------------------------
# Load required libraries
library(RBesT)
library(tidyverse)
library(ggplot2)
library(bayesplot)

# Default settings for bayesplot
color_scheme_set("blue")
theme_set(theme_default(base_size=12))

# Load example gMAP object
example(crohn)
print(map_crohn)

## ------------------------------------------------------------------------
forest_plot(map_crohn)

## ------------------------------------------------------------------------
forest_plot(map_crohn, model="both") + legend_move("right")

## ------------------------------------------------------------------------
# preview a color scheme
color_scheme_view("mix-blue-red")
# and now let's use it
color_scheme_set("mix-blue-red") 
forest_plot(map_crohn)
color_scheme_set("gray")
forest_plot(map_crohn)

## ------------------------------------------------------------------------
color_scheme_set("blue")
forest_plot(map_crohn, size=0.5, alpha=0)

## ---- fig.width=10, fig.height=6-----------------------------------------
# adjust the base font size
theme_set(theme_default(base_size=16))
forest_plot(map_crohn, model="both", est="MAP", size=1) + legend_move("right") +
  labs(title="Forest plot", subtitle="Results of Meta-Analytic-Predictive (MAP) analysis", 
       caption="Plot shows point estimates (posterior medians) with 95% intervals")

## ---- eval=FALSE---------------------------------------------------------
#  ggsave("plot1.png", last_plot(), width=1.62*2.78, height=2.78, unit="in") # too small for the chosen font size
#  ggsave("plot2.png", last_plot(), width=1.62*5.56, height=5.56, unit="in") # fits a single ppt slide quite well

## ---- echo=FALSE---------------------------------------------------------
theme_set(theme_default(base_size=12))
forest_plot(map_crohn) + labs(title="Original forest plot")

## ------------------------------------------------------------------------
# Extract the data from the returned object
fp_data <- forest_plot(map_crohn)$data
print(fp_data, digits=2)
# Use a two-component map mixture to compute the vertical line location
map_mix <- mixfit(map_crohn, Nc=2)
# Finally compose a ggplot call for the desired graph
ggplot(fp_data, aes(x=study, y=median, ymin=low, ymax=up, linetype=model, shape=model)) + 
  geom_pointrange(size=0.7, position=position_dodge(width=0.5)) + 
  geom_hline(yintercept=qmix(map_mix, 0.5), linetype=3, alpha=0.5) +
  coord_flip() + theme_bw(base_size=12) + theme(legend.position="None") + 
  labs(x="", y="Response", title="Modified forest plot")

## ------------------------------------------------------------------------
# Define prior distributions
prior_pbo <- mixbeta(inf1=c(0.60, 19, 29), inf2=c(0.30, 4, 5), rob=c(0.10, 1, 1))
prior_trt <- mixbeta(c(1, 1/3, 1/3))

# Study sample size
n_trt <- 50
n_pbo <- 20

# Create decision rules and designs to represent success and futility
success <- decision2S(pc=c(0.90, 0.50), qc=c(log(1), log(0.50)), lower.tail=TRUE, link="log")
futility <- decision2S(pc=c(0.10, 0.50), qc=c(log(1), log(0.50)), lower.tail=FALSE, link="log")
design_suc <- oc2S(prior_trt, prior_pbo, n_trt, n_pbo, success)
design_fut <- oc2S(prior_trt, prior_pbo, n_trt, n_pbo, futility)
crit_suc <- decision2S_boundary(prior_trt, prior_pbo, n_trt, n_pbo, success)
crit_fut <- decision2S_boundary(prior_trt, prior_pbo, n_trt, n_pbo, futility)

# Create a data frame that holds the outcomes for y1 (treatment) that define success and futility, 
# conditional on the number of events on y2 (placebo)
outcomes <- data.frame(y2=c(0:n_pbo), suc=crit_suc(0:n_pbo), fut=crit_fut(0:n_pbo), max=n_trt)
outcomes$suc <- with(outcomes, ifelse(suc<0, 0, suc)) # don't allow negative number of events

# Finally put it all together in a plot. 
o <- 0.5 # offset
ggplot(outcomes, aes(x=y2, ymin=-o, ymax=suc+o)) + geom_linerange(size=4, colour="green", alpha=0.6) + 
  geom_linerange(aes(ymin=suc+o, ymax=fut+o), colour="orange", size=4, alpha=0.6) + 
  geom_linerange(aes(ymin=fut+o, ymax=max+o), colour="red", size=4, alpha=0.6) + 
  annotate("text", x=c(2,14), y=c(36,8), label=c("STOP", "GO"), size=10) + 
  scale_x_continuous(breaks=seq(0,n_pbo,by=2)) + 
  scale_y_continuous(breaks=seq(0,n_trt,by=4)) + 
  labs(x="Events on placebo", y="Events on treatment", title="Study outcomes") + 
  coord_flip() + theme_bw(base_size=12)

## ---- fig.width=8.5, fig.height=5.5--------------------------------------
# Define the grid of true event rates for which to evaluate OC
p_trt <- seq(0, 0.5, length=200)
p_pbo <- c(0.35, 0.40, 0.45, 0.50)

# Loop through the values for placebo and compute outcome probabilities 
oc_list <- lapply(p_pbo, function(x) {
  p_go <- design_suc(p_trt, x)
  p_stop <- design_fut(p_trt, x)
  data.frame(p_trt, p_pbo=x, Go=p_go, Stop=p_stop, Indeterminate=1-p_go-p_stop)
})
# The above returns a list, so we bind the elements together into one data frame
oc <- bind_rows(oc_list) 
# And convert from wide to long format
oc <- gather(oc, "Outcome", "Probability", 3:5)
oc$facet_text <- as.factor(paste("True placebo rate = ", oc$p_pbo, sep=""))

# Finally we are ready to plot
ggplot(oc, aes(x=p_trt, y=Probability, colour=Outcome, linetype=Outcome)) + 
  facet_wrap(~facet_text) + geom_line(size=1) + 
  scale_colour_manual(values=c("green", "orange", "red"), name="Outcome") + 
  scale_linetype(guide=FALSE) + 
  geom_hline(yintercept=c(0.1, 0.8), linetype=3) + 
  scale_y_continuous(breaks=seq(0, 1, by=0.2)) + 
  labs(x="True event rate for treatment", y="Probability", title="Operating Characteristics") + 
  theme_bw(base_size=12) 

## ------------------------------------------------------------------------
sessionInfo()

