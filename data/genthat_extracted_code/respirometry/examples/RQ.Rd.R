library(respirometry)


### Name: RQ
### Title: Calculate respiratory quotient
### Aliases: RQ

### ** Examples

o2_observations <- c(21, 18, 14.5, 7)
pH_observations <- c(8.05, 7.98, 7.86, 7.65)
TA_observations <- c(2222, 2219, 2208, 2214)

RQ(o2 = o2_observations, o2_unit = 'kPa', pH = pH_observations,
TA = TA_observations, temp = 20, sal = 33)

DIC_observations <- c(2222, 2250, 2284, 2355)
RQ(o2 = o2_observations, o2_unit = 'kPa', DIC = DIC_observations)

RQ(o2 = o2_observations, o2_unit = 'kPa', pH = pH_observations, TA = 2032)



