library(DescTools)


### Name: TMod
### Title: Comparison Table For Linear Models
### Aliases: TMod ModSummary ModSummary.lm ModSummary.glm
### Keywords: mod

### ** Examples

r.full <- lm(Fertility ~ . , swiss)
r.nox <- lm(Fertility ~ . -Examination - Catholic, swiss)
r.grp <- lm(Fertility ~ . -Education - Catholic + CutQ(Catholic), swiss)
r.gam <- glm(Fertility ~ . , swiss, family=Gamma(link="identity"))
r.gama <- glm(Fertility ~ .- Agriculture , swiss, family=Gamma(link="identity"))

TMod(r.full, r.nox, r.grp, r.gam, r.gama)

# display confidence intervals
TMod(r.full, r.nox, r.gam, FUN = function(est, se, tval, pval, lci, uci){
  gettextf("%s [%s, %s]",
           Format(est, fmt=Fmt("num")),
           Format(lci, digits=3),
           Format(uci, digits=2)
           )
})


# cbind interface is not supported!!
# d.titanic <- reshape(as.data.frame(Titanic),
#                       idvar = c("Class","Sex","Age"),
#                       timevar="Survived",
#                       direction = "wide")
#
# r.glm0 <- glm(cbind(Freq.Yes, Freq.No) ~ 1, data=d.titanic, family="binomial")
# r.glm1 <- glm(cbind(Freq.Yes, Freq.No) ~ Class, data=d.titanic, family="binomial")
# r.glm2 <- glm(cbind(Freq.Yes, Freq.No) ~ ., data=d.titanic, family="binomial")

d.titanic <- Untable(Titanic)

r.glm0 <- glm(Survived ~ 1, data=d.titanic, family="binomial")
r.glm1 <- glm(Survived ~ Class, data=d.titanic, family="binomial")
r.glm2 <- glm(Survived ~ ., data=d.titanic, family="binomial")

TMod(r.glm0, r.glm1, r.glm2)

# plot OddsRatios
d.pima <- MASS::Pima.tr2

r.a <- glm(type ~ npreg + bp + skin + bmi + ped + age, data=d.pima, family=binomial)
r.b <- glm(type ~ npreg + glu + bp + skin, data=d.pima, family=binomial)
r.c <- glm(type ~ npreg + age, data=d.pima, family=binomial)

or.a <- OddsRatio(r.a)
or.b <- OddsRatio(r.b)
or.c <- OddsRatio(r.c)


# create the model table
tm <- TMod(m_A=or.a, m_B=or.b, m_C=or.c)
# .. and plotit
plot(tm, main="ORs for Models A, B, C",
     pch=15, col=c(hred, hblue), xlim=c(0.5, 1.5), panel.first=abline(v=1, col="grey"))



