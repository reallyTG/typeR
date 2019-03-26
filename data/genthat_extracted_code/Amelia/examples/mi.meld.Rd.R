library(Amelia)


### Name: mi.meld
### Title: Combine Multiple Results From Multiply Imputed Datasets
### Aliases: mi.meld

### ** Examples

data(africa)
m <- 5
a.out <- amelia(x = africa, m=m, cs = "country", ts = "year", logs = "gdp_pc")

b.out<-NULL
se.out<-NULL
for(i in 1:m) {
  ols.out <- lm(civlib ~ trade ,data = a.out$imputations[[i]])
  b.out <- rbind(b.out, ols.out$coef)
  se.out <- rbind(se.out, coef(summary(ols.out))[,2])
}

combined.results <- mi.meld(q = b.out, se = se.out)



