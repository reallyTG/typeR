library(Causata)


### Name: Woe
### Title: Weight of evidence for each level of a factor.
### Aliases: Woe Woe.factor

### ** Examples

library(stringr)

# create a factor with three levels
# - odds of 1 for a:  1:2 = 2.0
# - odds of 1 for b:  2:1 = 0.5
# - odds of 1 for NA: 1:1 = 1.0
f1  <- factor(c(str_split("a a a b b b", " ")[[1]], NA,NA))
dv1 <- c(                  1,1,0,0,0,1,              1, 0 )
fw1 <- Woe(f1,dv1)
fw1$odds

# discretize a continuous variable into a factor with 10 levels and compute WOE,
data(df.causata)
dv <- df.causata$has.responded.mobile.logoff_next.hour_466
f2 <- BinaryCut(df.causata$online.average.authentications.per.month_all.past_406, dv)
fw2 <- Woe(f2, dv, civ=df.causata$online.average.authentications.per.month_all.past_406)
fw2$odds
fw2$linearity



