## ----import, include = FALSE---------------------------------------------
library(ggplot2)
library(testassay)
library(dplyr)
d <- gia
tab<-table(d$sample,d$assay)
rowNames<-dimnames(tab)[[1]]
n.ones<-function(x){
    length(x[x==1])
}
nOnes<-apply(tab,1,n.ones)
sample4<-names(nOnes[nOnes==4])
td7samp<- sample4[grep("3D7",sample4)]
fvosamp<- sample4[grep("FVO",sample4)]

## check that each sample is repeated on 4 assays
J<- d$sample %in% td7samp
tab3d7<-table(d$sample[J],d$assay[J])

## now fvo
J<- d$sample %in% fvosamp
tabfvo<-table(d$sample[J],d$assay[J])


## ----ex------------------------------------------------------------------
summary(gia)

## ----pl1, echo = FALSE, message = FALSE----------------------------------
ggplot(d, aes(x = gia, y = meanAAgia, color = parasite))  + 
  geom_abline(slope = 1, intercept = 0, color = "gray", size = 1.5) + geom_point() + 
  scale_x_continuous("GIA", limits = c(-5, 100), breaks = seq(0, 100, by = 20)) + 
  scale_y_continuous("mean GIA (per sample)", limits = c(-5, 100), breaks = seq(0, 100, by = 20)) + theme_bw() +
  theme(legend.position = c(.85, .2))


## ----giatest1------------------------------------------------------------
treD7.test <- testassay(x = gia, 
                        m = sample, n = assay, q = .9, 
                        model = "normal", constant = "variance", 
                        data = subset(gia, parasite == "3D7" & meanAAgia < 80))

treD7.test

## ----giapredict----------------------------------------------------------
obsD7 <- rnorm(5, mean = 50, sd = 18)
predict(treD7.test, newdata = obsD7)

## ----giatest2------------------------------------------------------------
FVO.test <- testassay(x = gia, 
                        m = sample, n = assay, q = .9, 
                        model = "normal", constant = "variance", 
                        data = subset(gia, parasite == "FVO" & meanAAgia < 80))

FVO.test

predict(FVO.test)

## ----predplot------------------------------------------------------------
predat <- bind_cols(subset(gia, parasite == "FVO" & meanAAgia < 80), predict(FVO.test))

ggplot(predat, 
       aes(x = assay, y = obs, ymin = lower, ymax = upper)) + 
  geom_pointrange() + facet_wrap(~ sample) + ylab("GIA")

## ----giacv---------------------------------------------------------------
newobs <- c(25, 40, 65)
predict(treD7.test, newobs)

cvn <- testassay(x = gia, 
          m = sample, n = assay, q = .9, 
          model = "normal", constant = "cv", 
          data = subset(gia, parasite == "3D7" & meanAAgia < 80))

predict(cvn, newobs)

cvln <- testassay(x = gia, 
          m = sample, n = assay, q = .9, 
          model = "lognormal", constant = "cv", 
          data = subset(gia, parasite == "3D7" & meanAAgia < 80))

predict(cvln, newobs)

