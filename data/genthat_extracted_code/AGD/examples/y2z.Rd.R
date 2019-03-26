library(AGD)


### Name: y2z
### Title: Converts measurements to standard deviation scores (SDS)
### Aliases: y2z
### Keywords: distribution

### ** Examples



boys <- boys7482

# SDS of height 115 cm at age 5 years, 
# relative to Dutch boys reference
y2z(y=115, x=5)

# same relative to Dutch girls
y2z(y=115, x=5, sex="F")

# SDS of IOTF BMI cut-off value for overweight (boys 2-18) 
# relative to Dutch boys reference
cutoff <- c(
18.41, 18.15, 17.89, 17.72, 17.55, 17.49, 17.42, 17.49, 17.55, 17.74,
17.92, 18.18, 18.44, 18.77, 19.10, 19.47, 19.84, 20.20, 20.55, 20.89, 
21.22, 21.57, 21.91, 22.27, 22.62, 22.96, 23.29, 23.60, 23.90, 24.18, 
24.46, 24.73, 25.00)
age <- seq(2, 18, by=0.5)
(z <- y2z(y=cutoff, x=age, sex="M", ref=nl4.bmi))

# apply inverse transformation to check calculations
round(z2y(z, age, ref=nl4.bmi), 2)
cutoff

# calculate percentiles of weight 12 kg at 2 years (boys, girls)
100*round(pnorm(y2z(y=c(12,12), x=2, sex=c("M","F"), ref=nl4.wgt)),2)

# # percentage of children lighter than 15kg at ages 2-5
e <- expand.grid(age=2:5, sex=c("M","F"))
z <- y2z(y=rep(15,nrow(e)), x=e$age, sex=e$sex, ref=nl4.wgt)
w <- matrix(100*round(pnorm(z),2), nrow=2, byrow=TRUE)
dimnames(w) <- list(c("boys","girls"),2:5)
w

# analysis in Z scale
hgt.z <- y2z(y=boys$hgt, x=boys$age, sex="M", ref=nl4.hgt)
wgt.z <- y2z(y=boys$wgt, x=boys$age, sex="M", ref=nl4.wgt)
plot(hgt.z, wgt.z, col="blue")


# z2y

# quantile at SD=0 of age 2 years, 
# height Dutch boys
z2y(z=0, x=2)

# same for Dutch girls
z2y(z=0, x=2, sex="F")

# quantile at SD=c(-1,0,1) of age 2 years, BMI Dutch boys
z2y(z=c(-1,0,+1), x=2, ref=nl4.bmi)

# 0SD line (P50) in kg of weight for age in 5-10 year, Dutch boys
z2y(z=rep(0,6), x=5:10, ref=nl4.wgt)

# 95th percentile (P95), age 10 years, wfa, Dutch boys
z2y(z=qnorm(0.95), x=10, ref=nl4.wgt)

# table of P3, P10, P50, P90, P97 of weight for 5-10 year old dutch boys
# age per year
age <- 5:10
p <- c(0.03,0.1,0.5,0.9,0.97)
z <- rep(qnorm(p), length(age))
x <- rep(age, each=length(p))
w <- matrix(z2y(z, x=x, sex="M", ref=nl4.wgt), ncol=length(p),
 byrow=TRUE)
dimnames(w) <- list(age, p)
round(w,1)

# standard set of Z-scores of weight for all tabulated ages, boys & girls
# and three etnicities
sds <- c(-2.5, -2, -1, 0, 1, 2, 2.5)
age <- nl4.wgt$x
z <- rep(sds, times=length(age))
x <- rep(age, each=length(sds))
sex <- rep(c("M","F"), each=length(z)/2)
w <- z2y(z=z, x=x, sex=sex, ref=nl4.wgt)
w <- matrix(w, ncol=length(sds), byrow=TRUE)
dimnames(w) <- list(age, sds)
data.frame(sub=nl4.wgt$sub,sex=nl4.wgt$sex,round(w,2), row.names=NULL)

# P85 of BMI in 5-8 year old Dutch boys and girls
e <- expand.grid(age=5:8, sex=c("M","F"))
w <- z2y(z=rep(qnorm(0.85),nrow(e)), x=e$age, sex=e$sex, ref=nl4.bmi)
w <- matrix(w, nrow=2, byrow=TRUE)
dimnames(w) <- list(c("boys","girls"),5:8)
w

# data transformation of height z-scores to cm-scale
z <- c(-1.83, 0.09, 2.33, 0.81, -1.20)
x <- c(8.33,  0.23, 19.2, 24.3, 10)
sex <- c("M", "M", "F", "M", "F")
round(z2y(z=z, x=x, sex=sex, ref=nl4.hgt), 1)

# interpolate published height standard 
# to daily values, days 0-31, boys
# on centiles -2SD, 0SD and +2SD 
days <- 0:31
sds  <- c(-2, 0, +2)
z    <- rep(sds, length(days))
x    <- rep(round(days/365.25,4), each=length(sds))
w    <- z2y(z, x, sex="M", ref=nl4.hgt)
w    <- matrix(w, ncol=length(sds), byrow=TRUE)
dimnames(w) <- list(days, sds)
w




