library(mvinfluence)


### Name: influence.mlm
### Title: Regression Deletion Diagnostics for Multivariate Linear Models
### Aliases: as.data.frame.inflmlm influence.mlm print.inflmlm
### Keywords: models regression

### ** Examples

# Rohwer data
Rohwer2 <- subset(Rohwer, subset=group==2)
rownames(Rohwer2)<- 1:nrow(Rohwer2)
Rohwer.mod <- lm(cbind(SAT, PPVT, Raven) ~ n+s+ns+na+ss, data=Rohwer2)

# m=1 diagnostics
influence(Rohwer.mod)

# try an m=2 case
res2 <- influence.mlm(Rohwer.mod, m=2, do.coef=FALSE)
res2.df <- as.data.frame(res2)
head(res2.df)
scatterplotMatrix(log(res2.df))


influencePlot(Rohwer.mod, id.n=4, type="cookd")


# Sake data
Sake.mod <- lm(cbind(taste,smell) ~ ., data=Sake)
influence(Sake.mod)
influencePlot(Sake.mod, id.n=3, type="cookd")




