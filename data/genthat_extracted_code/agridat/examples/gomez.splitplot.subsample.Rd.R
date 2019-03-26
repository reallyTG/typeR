library(agridat)


### Name: gomez.splitplot.subsample
### Title: Height of rice in a split-plot experiment with subsamples
### Aliases: gomez.splitplot.subsample
### Keywords: datasets

### ** Examples


data(gomez.splitplot.subsample)
dat <- gomez.splitplot.subsample
if(require(HH)){
  interaction2wt(height ~ rep + time + manage, data=dat,
                 x.between=0, y.between=0,
                 main="gomez.splitplot.subsample - plant height")
}

# Management totals, Gomez table 6.8
tapply(dat$height, dat$manage, sum)

# Gomez table 6.11 analysis of variance
m1 <- aov(height ~ rep + manage + time + manage:time +
          Error(rep/manage/time), data=dat)
summary(m1)
## Error: rep
##     Df Sum Sq Mean Sq
## rep  2   2632    1316

## Error: rep:manage
##           Df Sum Sq Mean Sq F value Pr(>F)
## manage     7   1482  211.77   2.239 0.0944 .
## Residuals 14   1324   94.59
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Error: rep:manage:time
##             Df Sum Sq Mean Sq F value   Pr(>F)
## time         3  820.8  273.61   7.945 0.000211 ***
## manage:time 21  475.3   22.63   0.657 0.851793
## Residuals   48 1653.1   34.44
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Error: Within
##           Df Sum Sq Mean Sq F value Pr(>F)
## Residuals 96  167.4   1.744




