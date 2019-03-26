## ----label = "setup", include = FALSE------------------------------------
knitr::opts_chunk$set(collapse = TRUE)

## ------------------------------------------------------------------------
set.seed(42)
library(magrittr)
library(qwraps2)

# define the markup language we are working in.
# options(qwraps2_markup = "latex") is also supported.
options(qwraps2_markup = "markdown")

data(mtcars)

mtcars2 <-
  dplyr::mutate(mtcars,
                cyl_factor = factor(cyl,
                                    levels = c(6, 4, 8),
                                    labels = paste(c(6, 4, 8), "cylinders")),
                cyl_character = paste(cyl, "cylinders"))

str(mtcars2)

## ------------------------------------------------------------------------
with(mtcars2, table(cyl_factor, cyl_character))
with(mtcars2, all.equal(factor(cyl_character), cyl_factor))

## ------------------------------------------------------------------------
mean_sd(mtcars2$mpg)
mean_sd(mtcars2$mpg, denote_sd = "paren")

## ------------------------------------------------------------------------
mci <- mean_ci(mtcars2$mpg)
mci
print(mci, show_level = TRUE)

## ------------------------------------------------------------------------
median_iqr(mtcars2$mpg)

## ------------------------------------------------------------------------
n_perc(mtcars2$cyl == 4)
n_perc0(mtcars2$cyl == 4)

n_perc(mtcars2$cyl_factor == 4)  # this returns 0 (0.00%)
n_perc(mtcars2$cyl_factor == "4 cylinders")
n_perc(mtcars2$cyl_factor == levels(mtcars2$cyl_factor)[2])

# The count and percentage of 4 or 6 cylinders vehicles in the data set is
n_perc(mtcars2$cyl %in% c(4, 6))

## ------------------------------------------------------------------------
x <- runif(6, min = 4, max = 70)

# geometric mean
mu_g <- prod(x) ** (1 / length(x))
mu_g
exp(mean(log(x)))
1.2 ** mean(log(x, base = 1.2))

# geometric standard deviation
exp(sd(log(x)))  ## This is wrong

# these equations are correct
sigma_g <- exp(sqrt(sum(log(x / mu_g) ** 2) / length(x)))
sigma_g

exp(sqrt((length(x) - 1) / length(x)) * sd(log(x)))

## ------------------------------------------------------------------------
gmean(x)
all.equal(gmean(x), mu_g)

gvar(x)
all.equal(gvar(x), sigma_g^2)  # This is supposed to be FALSE
all.equal(gvar(x), exp(log(sigma_g)^2))

gsd(x)
all.equal(gsd(x), sigma_g)

## ------------------------------------------------------------------------
gmean_sd(x)

## ------------------------------------------------------------------------
args(summary_table)

## ------------------------------------------------------------------------
our_summary1 <-
  list("Miles Per Gallon" =
       list("min" = ~ min(.data$mpg),
            "max" = ~ max(.data$mpg),
            "mean (sd)" = ~ qwraps2::mean_sd(.data$mpg)),
       "Displacement" =
       list("min" = ~ min(.data$disp),
            "median" = ~ median(.data$disp),
            "max" = ~ max(.data$disp),
            "mean (sd)" = ~ qwraps2::mean_sd(.data$disp)),
       "Weight (1000 lbs)" =
       list("min" = ~ min(.data$wt),
            "max" = ~ max(.data$wt),
            "mean (sd)" = ~ qwraps2::mean_sd(.data$wt)),
       "Forward Gears" =
       list("Three" = ~ qwraps2::n_perc0(.data$gear == 3),
            "Four"  = ~ qwraps2::n_perc0(.data$gear == 4),
            "Five"  = ~ qwraps2::n_perc0(.data$gear == 5))
       )

## ----results = "asis"----------------------------------------------------
### Overall
whole <- summary_table(mtcars2, our_summary1)
whole

## ----results = "asis"----------------------------------------------------
### By number of Cylinders
by_cyl <- summary_table(dplyr::group_by(mtcars2, cyl_factor), our_summary1)
by_cyl

## ----results = "asis"----------------------------------------------------
both <- cbind(whole, by_cyl)
both

## ----results = "asis"----------------------------------------------------
print(both,
      rtitle = "Summary Statistics",
      cnames = c("Col 0", "Col 1", "Col 2", "Col 3"))

## ------------------------------------------------------------------------
mtcars2 %>%
  dplyr::select(.data$mpg, .data$cyl_factor, .data$wt) %>%
  qsummary(.)

## ----label="summary_table_mtcars2_default", results = "asis"-------------
mtcars2 %>%
  dplyr::select(.data$mpg, .data$cyl_factor, .data$wt) %>%
  summary_table(.)

## ------------------------------------------------------------------------
new_summary <-
  mtcars2 %>%
  dplyr::select(.data$mpg, .data$cyl_factor, .data$wt) %>%
  qsummary(.,
           numeric_summaries = list("Minimum" = "~ min(%s)",
                                    "Maximum" = "~ max(%s)"),
           n_perc_args = list(digits = 1, show_symbol = TRUE, show_denom = "always"))

## ----results = "asis"----------------------------------------------------
summary_table(mtcars2, new_summary)

## ----results = "asis"----------------------------------------------------
mtcars2 %>%
  dplyr::group_by(.data$am) %>%
  summary_table(., new_summary)

## ------------------------------------------------------------------------
both %>% str

## ------------------------------------------------------------------------
# difference in means
mpvals <-
  list(lm(mpg ~ cyl_factor,  data = mtcars2),
       lm(disp ~ cyl_factor, data = mtcars2),
       lm(wt ~ cyl_factor,   data = mtcars2)) %>%
  lapply(aov) %>%
  lapply(summary) %>%
  lapply(function(x) x[[1]][["Pr(>F)"]][1]) %>%
  lapply(frmtp) %>%
  do.call(c, .)

# Fisher test
fpval <- frmtp(fisher.test(table(mtcars2$gear, mtcars2$cyl_factor))$p.value)

## ------------------------------------------------------------------------
both <- cbind(both, "P-value" = "")
both[grepl("mean \\(sd\\)", rownames(both)), "P-value"] <- mpvals
a <- capture.output(print(both))
a[grepl("Forward Gears", a)] %<>% sub("&nbsp;&nbsp;\\ \\|$", paste(fpval, "|"), .)

## ----results = "asis"----------------------------------------------------
cat(a, sep = "\n")

## ----results = "asis"----------------------------------------------------
gear_summary <-
  list("Forward Gears" =
       list("Three" = ~ qwraps2::n_perc0(.data$gear == 3),
            "Four"  = ~ qwraps2::n_perc0(.data$gear == 4),
            "Five"  = ~ qwraps2::n_perc0(.data$gear == 5)),
       "Transmission" =
       list("Automatic" = ~ qwraps2::n_perc0(.data$am == 0),
            "Manual"  = ~ qwraps2::n_perc0(.data$am == 1))
       ) %>%
setNames(.,
         c(
         paste("Forward Gears: ", frmtp(fisher.test(xtabs( ~ gear + cyl_factor, data = mtcars2))$p.value)),
         paste("Transmission: ",  frmtp(fisher.test(xtabs( ~ am + cyl_factor, data = mtcars2))$p.value)))
         )

summary_table(dplyr::group_by(mtcars2, cyl_factor), gear_summary)

## ------------------------------------------------------------------------
print(sessionInfo(), local = FALSE)

