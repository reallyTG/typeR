## ----setup, include=FALSE, echo=FALSE-----------------------------------------
library(knitr)
# set global chunk options
opts_chunk$set(fig.path='figure/CrossScreening-', fig.align='center', fig.show='hold', par=TRUE)
options(formatR.arrow=TRUE, width = 80, digits = 4)
a4width<- 8.3
a4height<- 11.7
Sys.setenv(RSTUDIO_PDFLATEX = "/Library/TeX/texbin/latexmk")

## ----load---------------------------------------------------------------------
library(CrossScreening)
data(lead, methotrexate, nhanes.fish, nhanes.fish.match)

## ----difference---------------------------------------------------------------
d.lead <- lead$exposed[-21] - lead$control[-21] # the 21st control outcome is NA
d.methotrexate <- methotrexate[, 1:4] - methotrexate[, 6:9]
d.nhanes <- nhanes.log2diff()

## ----include=FALSE------------------------------------------------------------
## There is a machine precision issue (for example, 0.14 - 0.11 == 0.03 is FALSE)
## To exactly reproduce the result in Rosenbaum (2011), we round the values.
d.methotrexate$wmtm <- round(d.methotrexate$wmtm, 3)

## ----read gender, cache=FALSE, tidy=TRUE--------------------------------------
url <- "https://raw.githubusercontent.com/qingyuanzhao/CrossScreening/master/"
d.gender <- read.csv(paste0(url, "data/d.gender.csv"))

## -----------------------------------------------------------------------------
sen(d.lead, gamma = 1)$p.value

## ----warning = FALSE----------------------------------------------------------
wilcox.test(d.lead, alternative = "greater")$p.value

## -----------------------------------------------------------------------------
gamma <- c(1, 4, 4.5, 5, 5.5, 5.8)
round(sen(d.lead, gamma = gamma)$p.value, 3)

## -----------------------------------------------------------------------------
mm <- matrix(c(2, 2, 2, 5, 4, 5, 8, 7, 8, 8, 6, 8, 8, 5, 8, 8, 6, 7), nrow = 3)
gamma <- c(1, 1.3, 1.4, 2, 2.5)
round(sen(d.methotrexate$wmtm, mm, gamma, score.method = "exact")$p.value, 4)

## ----CI-----------------------------------------------------------------------
sen.ci(d.lead, gamma = c(1, 2), alpha.up = 0, alpha.low = 0.05)

## -----------------------------------------------------------------------------
gamma <- c(1, 1.25, 1.5)
round(apply(d.nhanes[, 1:8], 2, function(d) sen(d, gamma = gamma)$p.value2), 3)

## -----------------------------------------------------------------------------
mm <- matrix(c(2, 2, 2, 8, 5, 8), nrow = 3)
sen(d.nhanes$o.LBXTHG, mm, gamma = c(1, 5, 11, 14))$p.value2

## -----------------------------------------------------------------------------
sen(d.nhanes$o.LBXTHG, gamma = seq(13.6, 14, 0.05))$p.value2

## -----------------------------------------------------------------------------
kappa2gamma(sen.value(d.nhanes$o.LBXTHG, alpha = 0.05, alternative = "two.sided"))

## -----------------------------------------------------------------------------
kappa2gamma(sen.value(d.nhanes[, c(1:5, 18, 21, 23)],
alpha = 0.05, mm = mm, alternative = "two.sided"))

## ----gamma star gender, cache=FALSE, tidy=TRUE--------------------------------
gamma.star <- kappa2gamma(sen.value(d.gender, alpha = 0.05, alternative = "two.sided"))

## ----qq, fig.width=0.4*a4width, fig.height=0.4*a4width, fig.cap="Quantile-quantile plot of the sensitivity values in the gender dataset"----
library(ggplot2)
ggplot() + aes(sample = gamma.star) + stat_qq() +
xlab("Normal quantile") + ylab("Sensitivity value quantile")

## -----------------------------------------------------------------------------
d <- rnorm(100) + 0.3
mm <- matrix(c(2, 2, 2, 8, 5, 8), nrow = 3)
power.sen(d = d, mm = mm, I = 200, gamma = 2)
power.sen(d = d, mm = mm, I = 500, gamma = 2)$power

## -----------------------------------------------------------------------------
set.seed(11)
split <- sample(1:nrow(d.nhanes), nrow(d.nhanes) / 2, replace = FALSE)
d1 <- d.nhanes[split, ]
d2 <- d.nhanes[- split, ]

## -----------------------------------------------------------------------------
cross.screen(d1, d2, gamma = 9, gamma.screen = 1.25, mm = c(2, 2, 2),
screen.method = "least.sensitive", least.sensitive = 3)$p

## -----------------------------------------------------------------------------
split <- sample(1:nrow(d.nhanes), nrow(d.nhanes) * 0.3, replace = FALSE)
d1 <- d.nhanes[split, ]
d2 <- d.nhanes[- split, ]
p.single <- cross.screen(d1, d2, gamma = 9, gamma.screen = 1.25, mm = c(2, 2, 2),
screen.method = "least.sensitive", least.sensitive = 3)$p1
p.adjust(p.single, "bonferroni")

## -----------------------------------------------------------------------------
mm <- matrix(c(8, 5, 8, 8, 7, 8, 8, 6, 7), nrow = 3)
cross.screen(d1, d2, gamma = 9, gamma.screen = 1.25, mm = mm,
screen.method = "least.sensitive", least.sensitive = 3)$p

## -----------------------------------------------------------------------------
output <- cross.screen(d1, d2, gamma = 1.5, gamma.screen = 1.25, mm = mm,
screen.method = "threshold")
attach(output)
s1.order
s2.order

## -----------------------------------------------------------------------------
s1.order[fallback.test(p1[s1.order], alpha = 0.05/2)]
s2.order[fallback.test(p2[s2.order], alpha = 0.05/2)]

## -----------------------------------------------------------------------------
which(p <= 0.05)

## ----include=FALSE------------------------------------------------------------
detach(output)

