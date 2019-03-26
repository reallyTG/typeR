library(PK)


### Name: eqv
### Title: Bioequivalence between AUCs
### Aliases: eqv eqv.ssd eqv.batch eqv.complete
### Keywords: htest

### ** Examples

## example of a serial sampling design from Nedelman et al. (1995)
data(CPI975)
data <- subset(CPI975,dose>=30)

data$concadj <- data$conc / data$dose

# fieller and z-interval for ratio of dose-normalized AUCs
eqv(conc=data$concadj, time=data$time, group=data$dose, method=c("z","fieller"), 
     design="ssd")

# bootstrap-t interval for ratio of dose-normalized AUCs stratified for sex
set.seed(310578)
eqv(conc=data$concadj, time=data$time, group=data$dose, method="boott",
        strata=data$sex, nsample=500, design="ssd")


## Example of an independent batch design from Yeh (1990) 
conc <- list(batch1=c(0,0,0,0,0,0, 4.690,2.070,6.450,0.1,0.852,0.136, 
                      4.690,4.060,6.450,0.531,1.2,0.607),
           batch2=c(4,1.3,3.2,0.074,0.164,0.267, 6.68,3.83,6.08,0.669,1.21,0.878, 
                    8.13,9.54,6.29,0.923,1.65,1.04),
           batch3=c(9.360,13,5.48,1.090,1.370,1.430, 5.180,5.180,2.79,0.804,1.47,1.26, 
                    1.060,2.15,0.827,0.217,0.42,0.35))  
time <- list(batch1=c(rep(0,6),rep(1,6),rep(4,6)),
             batch2=c(rep(0.5,6),rep(2,6),rep(6,6)),
             batch3=c(rep(8,6),rep(12,6),rep(24,6)))
group <- list(batch1=rep(rep(c(1,2),each=3),3), batch2=rep(rep(c(1,2),each=3),3),
              batch3=rep(rep(c(1,2),each=3),3))

eqv(conc=conc, time=time, group=group, dependent=FALSE, method=c("fieller"), 
    conf.level=0.90, design="batch")

## example of independent batch data with overlapping batches 
## (Example 2.3.1 in Jaki and Wolfsegger, 2012)
conc <-list(batch1=c(0,0,0,0,0,0,0, 29.2,55.9,112.2,84.5,32.8,25.8,42.8,
                     145,153,169,192,181,151,136, 282,420,532,629,271,523,442,
                     727,1033,759,873,402,1031,751, 1360,1388,1425,1246,783,1294,1227, 
                     1939,1279,1318,1633,2073,1385,1682, 1614,1205,1542,1375,1842,1291,1517,
                     1238,1113,1386,1006,1610,1143,1379, 648,770,786,616,883,571,791,
                     392,438,511,379,389,334,548, 77.3,90.1,97.9,84.4,75.8,83.3,91.1),
            batch2=c(0,0,0,0,0,0,0, 69.7,37.2,213,64.1,151,57,50, 167,306,799,406,510,544,216,
                     602,758,987,627,1023,975,762, 1023,1124,1301,880,1477,1217,1144,
                     1388,1374,1756,1120,1643,1126,1238, 1481,1129,1665,1598,1524,1759,1605,
                     1346,1043,1529,1481,1126,1564,1472, 658,576,772,851,577,867,880, 
                     336,325,461,492,339,510,511, 84,75.9,82.6,116,77.3,101.9,112.6))

time <- list(batch1=rep(c(0,0.25,0.5,0.75,1,1.5,2,3,4,8,12,24),each=7),
             batch2=rep(c(0,0.5,0.75,1,1.5,2,3,4,8,12,24),each=7))

group <- list(batch1=rep(c(rep(1,3),rep(2,4)),12),
              batch2=rep(c(rep(1,4),rep(2,3)),11))

eqv(conc=conc, time=time, group=group, dependent=FALSE, method=c("fieller"), 
    conf.level=0.90, design="batch")

## example for a dependent batch data design from Wolfsegger and Jaki (2009)
conc <- list(batch1=c(0.46,0.2,0.1,0.1, 1.49,1.22,1.27,0.53, 0.51,0.36,0.44,0.28),
             batch2=c(1.51,1.80,2.52,1.91, 0.88,0.66,0.96,0.48),
             batch3=c(1.52,1.46,2.55,1.04, 0.54,0.61,0.55,0.27))
time <- list(batch1=c(0,0,0,0,1.5,1.5,1.5,1.5,10.5,10.5,10.5,10.5),
             batch2=c(5/60,5/60,5/60,5/60,4,4,4,4),
             batch3=c(0.5,0.5,0.5,0.5,7,7,7,7))
group <- list(batch1=c(1,1,2,2,1,1,2,2,1,1,2,2), batch2=c(1,1,2,2,1,1,2,2),
              batch3=c(1,1,2,2,1,1,2,2))

eqv(conc=conc, time=time, group=group, dependent=TRUE, method=c("fieller"), 
     conf.level=0.90, design="batch")


## example of a complete data design from Hand and Crowder (1996)
data(Glucose)
set.seed(271184)
eqv(conc=Glucose$conc, time=Glucose$time, group=Glucose$date, 
     dependent=TRUE, method=c("fieller", "z"), conf.level=0.90, 
     design="complete")



