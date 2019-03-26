library(umx)


### Name: iqdat
### Title: Twin data: IQ measured longitudinally
### Aliases: iqdat
### Keywords: datasets

### ** Examples

data(iqdat)
str(iqdat)
par(mfrow = c(1, 3))  # 1 rows and 3 columns
plot(IQ_age4_T1 ~ IQ_age4_T2, ylim = c(50, 150), data = subset(iqdat, zygosity == "MZ"))
plot(IQ_age4_T1 ~ IQ_age4_T2, ylim = c(50, 150), data = subset(iqdat, zygosity == "DZ"))
plot(IQ_age1_T1 ~ IQ_age4_T2, data = subset(iqdat, zygosity == "MZ"))
par(mfrow = c(1, 1))  # back to as it was



