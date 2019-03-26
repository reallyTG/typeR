## ----kable, echo=F-------------------------------------------------------
library(knitr)
Expert1 <- matrix(data = c(0.43, 0.55, 0.65,
                           0.16, 0.27, 0.46,
                           0.03, 0.18, 0.23
            ),ncol=3,byrow=TRUE, dimnames=list(c("Remission","Progression","Dead"),c("LL","MED","UL")))
Expert2 <- matrix(data = c(0.35, 0.60, 0.70,
                           0.15, 0.30, 0.45,
                           0.00, 0.10, 0.20
            ),ncol=3,byrow=TRUE, dimnames=list(c("Remission","Progression","Dead"),c("LL","MED","UL")))

kable(Expert1, caption="Expert 1")
kable(Expert2, caption="Expert 2")


## ----fittingmCM, results='hide'------------------------------------------
library(modcmfitr)
library(nloptr)

set.seed(12345)
Outcomes <- c("Remission","Progression","Dead")
RawData <- matrix(data = c(0.43, 0.55, 0.65,
                          0.16, 0.27, 0.46,
                          0.03, 0.18, 0.23
           ),ncol=3,byrow=TRUE)
SearchParams <- c(10000,100) # number of iterations, max number of searches 
#                              (set to 100 here; you probably want more).
ModCMorCM <- 1 # flag to determine whether fitting mCM or CM distribution
Quantiles <- c(0.025,0.5,0.975) # example here is 95% credibility limits and median.

mCM <- fitModCM(Outcomes, RawData, SearchParams, ModCMorCM, Quantiles)


## ------------------------------------------------------------------------
print(mCM)

## ----echo=F--------------------------------------------------------------
y <- mCM[1:2,1:4]
rownames(y)<- c("Z1","Z2")
y

## ------------------------------------------------------------------------
print(mCM[,5:10])

## ----samplefrommCM-------------------------------------------------------
Z <- mCM[1:2,1:4]
rownames(Z) <- c("Z1","Z2")
print(Z)

mCMSamples <- rModCM(10,Z)
colnames(mCMSamples) <- c("Remission", "Progression", "Dead")
print(mCMSamples)

## ----fittingMultimCM, results='hide'-------------------------------------
Quantiles <- c(0.025,0.5,0.975) # to fit median and 95% Credibility Intervals
SearchParams <- c(10000,100) # number of iterations, max number of searches 
#                              (set to 100 here; you probably want more).

RawData <- data.frame(expert = as.character(c(1,1,1,2,2,2)),
                      Outcome = as.factor(c("Remission","Progression","Dead",
                                            "Remission","Progression","Dead")),
                      LL = as.numeric(c(0.43, 0.16, 0.03, 0.35, 0.15, 0.00)),
                     MED = as.numeric(c(0.55, 0.27, 0.18, 0.60, 0.30, 0.10)),
                      UL = as.numeric(c(0.65, 0.46, 0.23, 0.70, 0.45, 0.20)))

mCMMultipleExpert <- fitMultiplemCM(Quantiles, SearchParams, RawData)

## ------------------------------------------------------------------------
print(mCMMultipleExpert)

## ----mergeMultipleExperts------------------------------------------------
NrSamples <- 100000
RawData <- data.frame(expert = as.character(c(1,1,1,2,2,2)),
                      Outcome = as.factor(c("Remission","Progression","Dead",
                                            "Remission","Progression","Dead")),
                      a = mCMMultipleExpert$a,
                      b = mCMMultipleExpert$b,
                      L = mCMMultipleExpert$L,
                      U = mCMMultipleExpert$U)
mCMmerged <- mergeMultiplemCM(NrSamples,RawData)
mCMmerged <- round(mCMmerged,2)
print(mCMmerged)

## ----FittingMerged, results='hide'---------------------------------------
Outcomes <- c("Remission","Progression","Dead")
RawData <- mCMmerged
SearchParams <- c(10000,100) #number of iterations, max number of searches 
#                             (set to 100 here; you probably want more).
ModCMorCM <- 1
Quantiles <- c(0.025,0.5,0.975) # example here is 95% credibility limits and median.

mCMMultipleMerged <- fitModCM(Outcomes, RawData, SearchParams, ModCMorCM, Quantiles)


## ------------------------------------------------------------------------
print(mCMMultipleMerged)

## ----FittingDirichlet, results='hide'------------------------------------
library(gtools)
Outcomes <- c("Remission","Progression","Dead")
RawData <- matrix(data = c(0.43, 0.55, 0.65,
                           0.16, 0.27, 0.46,
                           0.03, 0.18, 0.23
            ),ncol=3,byrow=TRUE)
SearchParams <- c(10000,100) #number of iterations, max number of searches 
#                             (set to 100 here; you probably want more).
Quantiles <- c(0.025,0.5,0.975) # example here is 95% credibility limits and median.

D <- fitDirichlet(Outcomes, RawData, SearchParams, Quantiles)
D <- round(D,2)


## ------------------------------------------------------------------------
print(D)

## ----FittingCM, results='hide'-------------------------------------------
Outcomes <- c("Remission","Progression","Dead")
RawData <- matrix(data = c(0.43, 0.55, 0.65,
                          0.16, 0.27, 0.46,
                          0.03, 0.18, 0.23
           ),ncol=3,byrow=TRUE)
SearchParams <- c(10000,100)  #number of iterations, max number of searches 
#                              (set to 100 here; you probably want more).
ModCMorCM <- 0 # flag to determine whether fitting mCM or CM distribution
Quantiles <- c(0.025,0.5,0.975) # example here is 95% credibility limits and median.

CM <- fitModCM(Outcomes, RawData, SearchParams, ModCMorCM, Quantiles)


## ------------------------------------------------------------------------
print(CM)

## ------------------------------------------------------------------------
Z <- CM[1:2,1:4]
rownames(Z) <- c("Z1","Z2")
print(Z)

CMSamples <- rModCM(10,Z)
colnames(CMSamples) <- c("Remission", "Progression", "Dead")
print(CMSamples)

## ----fig.show='hold'-----------------------------------------------------
library(ggplot2)

#results from a run of fitModCM with 10,000 iterations
mCM <- matrix(data=c(6.1598312, 7.387483, 0.3443956, 0.7802353, 
                                  0.43, 0.55, 0.65, 0.44, 0.54, 0.66,
                     0.4274036, 1.153597, 0.4664444, 0.9830223, 
                                  0.16, 0.27, 0.46, 0.18, 0.26, 0.46,
                     0.0000000, 0.000000, 0.0000000, 0.0000000, 
                                  0.03, 0.18, 0.23, 0.03, 0.20, 0.28),
               nrow=3, byrow=T,
              dimnames = list(c("Remission","Progression","Dead"),
                              c("a","b","L","U",
                                "Tgt_LL","Tgt_MED","Tgt_UL",
                                "Mdl_LL","Mdl_MED","Mdl_UL")))

#results from a run of fitModCM with 10,000 iterations, ModCMorCM=0 
#(i.e. fitting a CM Distribution)
CM <- matrix(data=c(10, 8.589266, 0, 1, 
                            0.43, 0.55, 0.65, 0.32, 0.54, 0.75,
                    10, 6.793693, 0, 1, 
                            0.16, 0.27, 0.46, 0.13, 0.27, 0.46,
                     0, 0.000000, 0, 0, 
                            0.03, 0.18, 0.23, 0.07, 0.18, 0.35),
               nrow=3, byrow=T,
              dimnames = list(c("Remission","Progression","Dead"),
                              c("a","b","L","U",
                                "Tgt_LL","Tgt_MED","Tgt_UL",
                                "Mdl_LL","Mdl_MED","Mdl_UL")))

#results from a run of fitDirichlet with 10,000 iterations
D <- matrix(data=c(30.51, 
                        0.43, 0.55, 0.65, 0.43, 0.56, 0.68,
                   16.43, 
                        0.16, 0.27, 0.46, 0.19, 0.30, 0.42,
                    8.12, 
                        0.03, 0.18, 0.23, 0.07, 0.14, 0.25),
               nrow=3, byrow=T,
              dimnames = list(c("Remission","Progression","Dead"),
                              c("Dirichlet",
                                "Tgt_LL","Tgt_MED","Tgt_UL",
                                "Mdl_LL","Mdl_MED","Mdl_UL")))

df <- data.frame(
  Distributions = c("Target","mCM","CM","D"),
  y0 = c(0,0,0,0),
  y2_5 = c(0.43,mCM[1,8],CM[1,8],D[1,5]),
  y50 = c(0.55,mCM[1,9],CM[1,9],D[1,6]),
  y97_5 = c(0.65,mCM[1,10],CM[1,10],D[1,7]),
  y100 = c(1,1,1,1)
)
df$Distributions = factor(df$Distributions,levels=c("Target","mCM","CM","D")
                          ,ordered=TRUE) # order the distributions
ggplot(df, aes(Distributions)) +
  geom_boxplot(
   aes(ymin = y0, lower = y2_5, middle = y50, upper = y97_5, ymax = y100),
   stat = "identity") +
  ggtitle("Remission")

df$y2_5 = c(0.16,mCM[2,8],CM[2,8],D[2,5])
df$y50 = c(0.27,mCM[2,9],CM[2,9],D[2,6])
df$y97_5 = c(0.46,mCM[2,10],CM[2,10],D[2,7])
ggplot(df, aes(Distributions)) +
  geom_boxplot(
   aes(ymin = y0, lower = y2_5, middle = y50, upper = y97_5, ymax = y100),
   stat = "identity") +
  ggtitle("Progression")

df$y2_5 = c(0.03,mCM[3,8],CM[3,8],D[3,5])
df$y50 = c(0.18,mCM[3,9],CM[3,9],D[3,6])
df$y97_5 = c(0.23,mCM[3,10],CM[3,10],D[3,7])
ggplot(df, aes(Distributions)) +
  geom_boxplot(
   aes(ymin = y0, lower = y2_5, middle = y50, upper = y97_5, ymax = y100),
   stat = "identity") +
  ggtitle("Dead")

#calculate SSD for each fit:
SSD <- matrix(data=c(sum((mCM[,5:7]-mCM[,8:10])^2),
                     sum((CM[,5:7]-CM[,8:10])^2),
                     sum((D[,2:4]-D[,5:7])^2)),
                     ncol=3,
                     dimnames = (list(c("SSD"),c("mCM","CM","D"))))

kable(SSD, caption="Goodness of fit", align='l')


## ----fig.show='hold'-----------------------------------------------------
library(tidyr)
library(cowplot)

samples <- 100000
mCMSamples <- cbind("mCM",rModCM(samples,mCM[1:2,1:4]))
CMSamples <- cbind("CM",rModCM(samples,CM[1:2,1:4]))
DSamples <- cbind("D",rdirichlet(samples,D[,1]))
sampled <- rbind(mCMSamples,CMSamples,DSamples)
sampled <- as.data.frame(sampled)
sampled[,2:4] <- apply(sampled[,2:4],c(1,2),as.numeric)
colnames(sampled) <- c("Distribution","Remission","Progression","Dead")

sampled <- gather(sampled,"State","P",2:4)
sampled$State <- factor(sampled$State,levels=c("Remission","Progression","Dead"),
                        ordered=TRUE)
sampled$Distribution <- factor(sampled$Distribution,levels=c("mCM","CM","D"),
                               ordered=TRUE)

mCMDens <- ggplot(data=subset(sampled, sampled$Distribution=="mCM"), 
                  aes(x=P,colour=State, fill=State)) +
  geom_density(alpha=0.1, show.legend=T) +
  scale_x_continuous(name="P", limits= c(0,1)) +
  ggtitle("mCM")

legend <- get_legend(mCMDens)
mCMDens <- mCMDens + theme(legend.position='none')

CMDens <- ggplot(data=subset(sampled, sampled$Distribution=="CM"), 
                 aes(x=P,colour=State, fill=State)) +
  geom_density(alpha=0.1, show.legend=F) +
  scale_x_continuous(name="P", limits= c(0,1)) +
  ggtitle("CM")

DDens <- ggplot(data=subset(sampled, sampled$Distribution=="D"), 
                aes(x=P,colour=State, fill=State)) +
  geom_density(alpha=0.1, show.legend=F) +
  scale_x_continuous(name="P", limits= c(0,1)) +
  ggtitle("D")

ggdraw(mCMDens)
ggdraw(CMDens)
ggdraw(DDens)
ggdraw(legend)


