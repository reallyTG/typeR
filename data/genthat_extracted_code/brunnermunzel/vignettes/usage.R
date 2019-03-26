## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
x <- c(1.83,  0.50,  1.62,  2.48, 1.68, 1.88, 1.55, 3.06, 1.30)
y <- c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)

## ------------------------------------------------------------------------
dat <- data.frame(
    value = c(x, y),
    group = factor(rep(c("x", "y"), c(length(x), length(y))),
                   levels = c("x", "y")))

## ---- message=FALSE------------------------------------------------------
library(dplyr)
dat %>%
    group_by(group) %>%
    summarize_all(list(mean = mean, median = median))

## ---- echo=FALSE, fig.width=4, fig.asp=1, out.width="50%"----------------
library(ggplot2)
set.seed(100)
ggplot(dat, aes(x = group, y = value)) +
    geom_jitter(width = 0.01)

## ------------------------------------------------------------------------
library(brunnermunzel)

brunnermunzel.test(x, y)

brunnermunzel.test(value ~ group, data = dat)

## ---- message=FALSE------------------------------------------------------
brunnermunzel.test(x, y, perm = TRUE)

brunnermunzel.permutation.test(x, y)

## ------------------------------------------------------------------------
# sample size is 30
brunnermunzel.permutation.test(1:15, 3:17)

## ---- eval=FALSE---------------------------------------------------------
#  brunnermunzel.permutation.test(1:15, 3:17, force = TRUE)
#  #>
#  #>  permuted Brunner-Munzel Test
#  #>
#  #> data:  1:15 and 3:17
#  #> p-value = 0.2341

## ------------------------------------------------------------------------
brunnermunzel.test(x, y, alternative = "greater")

wilcox.test(x, y, alternative = "greater")

## ------------------------------------------------------------------------
dat$group

## ------------------------------------------------------------------------
brunnermunzel.test(value ~ group, data = dat, alternative = "greater")$p.value

wilcox.test(value ~ group, data = dat, alternative = "greater")$p.value

## ------------------------------------------------------------------------
brunnermunzel.test(x, y, alternative = "less")$p.value

wilcox.test(x, y, alternative = "less")$p.value

## ---- sample_data_matrix, echo=FALSE-------------------------------------
dat1 <- matrix(c(5, 3, 2, 1, 3, 6), nr = 2, byrow = TRUE)
dat2 <- as.table(dat1)
colnames(dat2) <- c("Normal", "Moderate", "Severe")

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(dat2, caption = "Fictional data")

## ---- sample_data_matrix, eval=FALSE-------------------------------------
#  dat1 <- matrix(c(5, 3, 2, 1, 3, 6), nr = 2, byrow = TRUE)
#  dat2 <- as.table(dat1)
#  colnames(dat2) <- c("Normal", "Moderate", "Severe")

## ------------------------------------------------------------------------
dat1  # matrix class

dat2  # table class

## ------------------------------------------------------------------------
brunnermunzel.test(dat1)

brunnermunzel.test(dat2)

## ------------------------------------------------------------------------
brunnermunzel.permutation.test(dat1)

brunnermunzel.permutation.test(dat2)

