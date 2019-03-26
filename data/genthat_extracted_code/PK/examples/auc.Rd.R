library(PK)


### Name: auc
### Title: Estimation of confidence intervals for the area under the
###   concentration versus time curve in complete and incomplete data
###   designs
### Aliases: auc auc.ssd auc.batch
### Keywords: htest

### ** Examples

#### serial sampling design:
## example from Bailer (1988)
time <- c(rep(0,4), rep(1.5,4), rep(3,4), rep(5,4), rep(8,4))
grp1 <- c(0.0658, 0.0320, 0.0338, 0.0438, 0.0059, 0.0030, 0.0084,
          0.0080, 0.0000, 0.0017, 0.0028, 0.0055, 0.0000, 0.0037,
          0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000)

grp2 <- c(0.2287, 0.3824, 0.2402, 0.2373, 0.1252, 0.0446, 0.0638,
          0.0511, 0.0182, 0.0000, 0.0117, 0.0126, 0.0000, 0.0440,
          0.0039, 0.0040, 0.0000, 0.0000, 0.0000, 0.0000)

grp3 <- c(0.4285, 0.5180, 0.3690, 0.5428, 0.0983, 0.0928, 0.1128,
          0.1157, 0.0234, 0.0311, 0.0344, 0.0349, 0.0032, 0.0052,
          0.0049, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000)

auc(conc=grp1, time=time, method='z', design='ssd')
auc(conc=grp2, time=time, method='z', design='ssd')
auc(conc=grp3, time=time, method='z', design='ssd')

## function call with data frame using simultaneous confidence intervals based 
## on bonferroni adjustment
data <- data.frame(conc=c(grp1, grp2, grp3), time=rep(time, 3),
                   group=c(rep(1, length(grp1)), rep(2, length(grp2)), 
                   rep(3, length(grp3))))

auc(subset(data, group==1 | group==2)$conc, subset(data, group==1 | group==2)$time, 
    group=subset(data, group==1 | group==2)$group, method=c('z', 't'), 
    conf.level=1-0.05/3, design='ssd')

auc(subset(data, group==1 | group==3)$conc, subset(data, group==1 | group==2)$time, 
    group=subset(data, group==1 | group==3)$group, method=c('z', 't'), 
    conf.level=1-0.05/3, design='ssd')

auc(subset(data, group==2 | group==3)$conc, subset(data, group==1 | group==2)$time, 
    group=subset(data, group==2 | group==3)$group, method=c('z', 't'), 
    conf.level=1-0.05/3, design='ssd')

## example from Nedelman et al. (1995)
data(CPI975)
data <- CPI975[CPI975[,'dose']>=30 ,]

auc(data=subset(data,sex=='m' & dose==30), method=c('z', 't'), design='ssd')
auc(data=subset(data,sex=='f' & dose==30), method=c('z', 't'), design='ssd')

auc(data=subset(data,sex=='m' & dose==100), method=c('z', 't'), design='ssd')
auc(data=subset(data,sex=='f' & dose==100), method=c('z', 't'), design='ssd')

## comparing dose levels
data$concadj <- data$conc / data$dose
data.100 <- subset(data, dose==100)
data.030 <- subset(data, dose==30)
res.100 <- auc(conc=data.030$concadj, time=data.030$time, method='t', design='ssd')
res.030 <- auc(conc=data.100$concadj, time=data.100$time, method='t', design='ssd')
plot(res.030, ylim=c(0, 140), xlim=c(0,25), pch=19, ylab='Dose-normalized concentration', 
      main='Comparison of doses')
plot(res.100, col='red', pch=21, add=TRUE)
legend(x=25, y=140, xjust=1, lty=1, col=c('black','red'), 
       legend=c('Dose of 30', 'Dose of 100'))

res <- auc(conc=data$concadj, time=data$time, group=data$dose, method=c('t','z'), 
            design='ssd')
print(res)
summary(res)

## comparing two dose level using stratified resampling per gender
## caution this might take a few minutes
set.seed(260151)
auc(conc=data$concadj, time=data$time, group=data$dose, method='boott',
    strata=data$sex, design='ssd', nsample=500)

#### batch design:
## a batch design example from Holder et al. (1999).
data(Rats)
data <- subset(Rats,Rats$dose==100)

# two-sided CI: data call
auc(data=data,method=c('z','t'), design='batch')
# one-sided CI: data call
auc(data=data,method=c('z','t'), alternative="less", design='batch')

## difference of two AUCs in batch design from Jaki and Wolfsegger (2009),
## originally in Holder et al. (1999).
data <- subset(Rats,Rats$dose==100 | Rats$dose==300 )
data$group <- data$dose
data$conc <- data$conc / data$dose

## data call
res1 <- auc(data=subset(data, dose==100), method='z', design='batch')
res2 <- auc(data=subset(data, dose==300), method='z', design='batch')
plot(res1, col='black', ylim=c(0,0.06), xlim=c(0,25), ylab='Dose-normalized concentration', 
      main='Comparison of doses')
plot(res2, col='red', add=TRUE)
legend(x=0, y=0.06, lty=1, col=c('black','red'), 
       legend=c('Dose of 100', 'Dose of 300'))

auc(data=data, method='z', design='batch')


## difference of two dependent AUCs in a batch design from Wolfsegger and Jaki (2009)
conc <- list(batch1=c(0.46,0.2,0.1,0.1, 1.49,1.22,1.27,0.53, 0.51,0.36,0.44,0.28),
             batch2=c(1.51,1.80,2.52,1.91, 0.88,0.66,0.96,0.48),
             batch3=c(1.52,1.46,2.55,1.04, 0.54,0.61,0.55,0.27))
time <- list(batch1=c(0,0,0,0,1.5,1.5,1.5,1.5,10.5,10.5,10.5,10.5),
             batch2=c(5/60,5/60,5/60,5/60,4,4,4,4),
             batch3=c(0.5,0.5,0.5,0.5,7,7,7,7))
group <- list(batch1=c(1,1,2,2,1,1,2,2,1,1,2,2),batch2=c(1,1,2,2,1,1,2,2),
              batch3=c(1,1,2,2,1,1,2,2))

# find difference in concentration and the corresponding times
dconc <- NULL
dtime <- NULL
grps <- unique(unlist(group))
B <- length(conc)
for(i in 1:B){
    dconc[[i]] <- conc[[i]][group[[i]]==grps[1]] - conc[[i]][group[[i]]==grps[2]]
    dtime[[i]] <- time[[i]][group[[i]]==grps[1]]
}
names(dconc) <- names(conc)

auc(conc=dconc, time=dtime, group=NULL, method="t", conf.level=0.90, design="batch")

## example with overlapping batches (Treatment A in Example of Jaki & Wolfsegger 2012)
conc <- list(batch1=c(0,0,0,0, 69.7,37.2,213,64.1,  167,306,799,406, 602,758,987,627,
                      1023,1124,1301,880, 1388,1374,1756,1120, 1481,1129,1665,1598,
                      1346,1043,1529,1481, 658,576,772,851, 336,325,461,492, 
                      84,75.9,82.6,116),
             batch2=c(0,0,0, 29.2,55.9,112.2, 145,153,169, 282,420,532, 727,1033,759, 
                      1360,1388,1425, 1939,1279,1318, 1614,1205,1542, 1238,1113,1386,
                      648,770,786, 392,438,511, 77.3,90.1,97.9))
time <- list(batch1=rep(c(0,0.5,0.75,1,1.5,2,3,4,8,12,24),each=4),
             batch2=rep(c(0,0.25,0.5,0.75,1,1.5,2,3,4,8,12,24),each=3))

auc.batch(conc,time,method=c("t","z"),conf.level=0.9)

#### complete data design:
## example from Gibaldi and Perrier (1982, page 436) for an individual AUC
time <- c(0, 0.165, 0.5, 1, 1.5, 3, 5, 7.5, 10)
conc <- c(0, 65.03, 28.69, 10.04, 4.93, 2.29, 1.36, 0.71, 0.38)
auc(conc=conc, time=time, design="complete")

## data Indometh
require(datasets)
Indometh$id <- as.character(Indometh$Subject)
Indometh <- Indometh[order(Indometh$id, Indometh$time),]
Indometh <- Indometh[order(Indometh$time),]
res <- auc.complete(conc=Indometh$conc, time=Indometh$time, method='t')
plot(res)

## more informative plot 
split.screen(c(1,2))
screen(1)
plot(x=c(0,8), y=c(0, 3), type='n', main='Observed concentration time-profiles', 
     xlab='Time', ylab='Concentration', las=1)
for(i in unique(Indometh$Subject)){
   temp <- subset(Indometh, Subject==i)
   points(x=temp$time, y=temp$conc, type='b')
}
screen(2)
plot(x=c(0,8), y=c(0.01, 9), type='n', main='Log-linear concentration time-profiles', 
     xlab='Time', ylab='Log of concentration', yaxt='n', log='y')
axis(side=2, at=c(0.01, 0.1, 1, 10), labels=c('0.01', '0.1', '1', '10'), las=1)
axis(side=2, at=seq(0.01, 0.1, 0.01), tcl=-0.2, labels=FALSE)
axis(side=2, at=seq(0.1, 1, 0.1), tcl=-0.2, labels=FALSE)
axis(side=2, at=seq(1, 10, 1), tcl=-0.2, labels=FALSE)
for(i in unique(Indometh$Subject)){
   temp <- subset(Indometh, Subject==i)
   points(x=temp$time, y=temp$conc, type='b')
}
close.screen(all = TRUE)



