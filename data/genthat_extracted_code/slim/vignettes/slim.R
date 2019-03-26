## ------------------------------------------------------------------------
library(slim)

## ------------------------------------------------------------------------
data(dialysis)
str(dialysis)

## ------------------------------------------------------------------------
library(ggplot2)

print(p <- ggplot(dialysis, aes(x = month, y = renalfn, group = id)) +
        geom_line(alpha = 0.1) + facet_grid(~ group))

## ------------------------------------------------------------------------
naive_means <- dialysis[, list(id = group, renalfn = mean(renalfn)),
        by = list(group, month)]

print(p <- p + geom_point(data = naive_means))

## ------------------------------------------------------------------------
slim_basic_fit <- slim(renalfn ~ group + month, dialysis)

summary(slim_basic_fit)

## ---- results = "hide"---------------------------------------------------
# identify one fully observed individual in each group
dialysis[, fully_observed := (length(month) == 5), by = id]
group_reps <- dialysis[(fully_observed), list(id = min(id)), by = group]  
setkey(group_reps, id) 

dialysis[, slim_basic := fitted(slim_basic_fit)]

## ------------------------------------------------------------------------
print(p <- p + geom_line(aes(y = slim_basic), data = dialysis[group_reps]))

## ---- results = "hide"---------------------------------------------------
slim_intercept_slope_fit <- slim(renalfn ~ group + month, dialysis,
        limit = ~ 1 + month) 

dialysis[, slim_intercept_slope := fitted(slim_intercept_slope_fit)]

## ------------------------------------------------------------------------
print(p <- p + geom_line(aes(y = slim_intercept_slope),
                data = dialysis[group_reps], linetype = "dashed"))

## ------------------------------------------------------------------------
small_example <- data.table(month = c(0, 3, 18))
z <- model.matrix(~ 1, small_example)
z %*% t(z)
z <- model.matrix(~ 1 + month, small_example)
z %*% t(z)

## ------------------------------------------------------------------------
vcov(slim_basic_fit)
vcov(slim_basic_fit, empirical = FALSE) # a bad idea for unmodelled covariances!
summary(slim_basic_fit)
summary(slim_basic_fit, empirical = FALSE) # still a bad idea

## ------------------------------------------------------------------------
library(lme4)

lmer_fit <- lmer(renalfn ~ group + month + (1 + month | id), dialysis)
slim_lmer_fit <- slim(renalfn ~ group + month, dialysis, covariance = lmer_fit)

summary(slim_lmer_fit)
summary(slim_lmer_fit, empirical = FALSE) # this now makes sense

## ------------------------------------------------------------------------
library(jmcm)

jmcm_fit <- jmcm(renalfn | id | month ~ group | 1, data = dialysis,
        triple = rep(2L, 3), cov.method = "mcd")
slim_jmcm_fit <- slim(renalfn ~ group + month, dialysis, covariance = jmcm_fit)

summary(slim_jmcm_fit)
summary(slim_jmcm_fit, empirical = FALSE)

## ---- results = "hide"---------------------------------------------------
dialysis[, slim_lmer := fitted(slim_lmer_fit)]
dialysis[, slim_jmcm := fitted(slim_jmcm_fit)]

## ------------------------------------------------------------------------
print(p <- p + geom_line(aes(y = slim_lmer), data = dialysis[group_reps],
                colour = "darkblue") +
        geom_line(aes(y = slim_jmcm), data = dialysis[group_reps],
                colour = "darkred"))

## ---- results = "hide"---------------------------------------------------
slim_pascal_fit <- slim(renalfn ~ group + month, dialysis,
        covariance = "pascal")

dialysis[, slim_pascal := fitted(slim_pascal_fit)]

## ------------------------------------------------------------------------
print(p <- p + geom_line(aes(y = slim_pascal), data = dialysis[group_reps],
                colour = "cyan"))

## ------------------------------------------------------------------------
extract_se <- function(fit) sqrt(diag(vcov(fit)))
sapply(list(se_basic = slim_basic_fit, se_pascal = slim_pascal_fit), extract_se)

