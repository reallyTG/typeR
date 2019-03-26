library(mmsample)


### Name: mmatcher
### Title: Multivariate Matching
### Aliases: mmatcher

### ** Examples

treat_n <- 100
control_n <- 300
n <- treat_n + control_n
set.seed(123)

df <- data.frame(age = round(c(rnorm(control_n, 40, 15), rnorm(treat_n, 60, 15)), 2),
                 male = c(rbinom(control_n, 1, 0.4), rbinom(treat_n, 1, 0.6)),
                 grp = c(rep(0, control_n), rep(1, treat_n)))
df$age[df$age < 20 | df$age > 95] <- NA

matched_df <- mmsample::mmatcher(df, "grp", c("age", "male"))

tapply(df$age, df$grp, quantile, na.rm = TRUE)
tapply(matched_df$age, matched_df$grp, quantile, na.rm = TRUE)

table(df$male, df$grp)
table(matched_df$male, matched_df$grp)



