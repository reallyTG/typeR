library(agridat)


### Name: foulley.calving
### Title: Calving difficulty by calf sex and age of dam
### Aliases: foulley.calving
### Keywords: datasets

### ** Examples


data(foulley.calving)
dat <- foulley.calving

## Plot
d2 <- transform(dat,
                age=ordered(age, levels=c("0.0-2.0","2.0-2.5","2.5-3.0",
                                          "3.0-3.5","3.5-4.0",
                                          "4.0-4.5","4.5-5.0","5.0-8.0","8.0+")),
                score=ordered(score, levels=c('S1','S2','S3')))
if(require(reshape2)){
d2 <- acast(dat, sex+age~score, value.var='count')
d2 <- prop.table(d2, margin=1)
require(lattice)
thm <- simpleTheme(col=c('skyblue','gray','pink'))
barchart(d2, par.settings=thm, main="foulley.calving",
         xlab="Frequency of calving difficulty", ylab="Calf gender and dam age",
         auto.key=list(columns=3, text=c("Easy","Assited","Difficult")))
}

## Ordinal multinomial model
## Not run: 
##D   require(ordinal)
##D   m2 <- clm(score ~ sex*age, data=dat, weights=count, link='probit')
##D   summary(m2)
##D 
##D   ##   Coefficients:
##D   ##                  Estimate Std. Error z value Pr(>|z|)    
##D   ## sexM             0.500605   0.015178  32.982  < 2e-16 ***
##D   ## age2.0-2.5      -0.237643   0.013846 -17.163  < 2e-16 ***
##D   ## age2.5-3.0      -0.681648   0.018894 -36.077  < 2e-16 ***
##D   ## age3.0-3.5      -0.957138   0.018322 -52.241  < 2e-16 ***
##D   ## age3.5-4.0      -1.082520   0.024356 -44.446  < 2e-16 ***
##D   ## age4.0-4.5      -1.146834   0.022496 -50.981  < 2e-16 ***
##D   ## age4.5-5.0      -1.175312   0.028257 -41.594  < 2e-16 ***
##D   ## age5.0-8.0      -1.280587   0.016948 -75.559  < 2e-16 ***
##D   ## age8.0+         -1.323749   0.024079 -54.974  < 2e-16 ***
##D   ## sexM:age2.0-2.5  0.003035   0.019333   0.157  0.87527    
##D   ## sexM:age2.5-3.0 -0.076677   0.026106  -2.937  0.00331 ** 
##D   ## sexM:age3.0-3.5 -0.080657   0.024635  -3.274  0.00106 ** 
##D   ## sexM:age3.5-4.0 -0.135774   0.032927  -4.124 3.73e-05 ***
##D   ## sexM:age4.0-4.5 -0.124303   0.029819  -4.169 3.07e-05 ***
##D   ## sexM:age4.5-5.0 -0.198897   0.038309  -5.192 2.08e-07 ***
##D   ## sexM:age5.0-8.0 -0.135524   0.022804  -5.943 2.80e-09 ***
##D   ## sexM:age8.0+    -0.131033   0.031852  -4.114 3.89e-05 ***
##D   ## ---
##D   ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
##D   
##D   ## Threshold coefficients:
##D   ##       Estimate Std. Error z value
##D   ## S1|S2  0.82504    0.01083   76.15
##D   ## S2|S3  1.52017    0.01138  133.62
##D 
##D   ## Note 1.52017 - 0.82504 = 0.695 matches Foulley's '2-3' threshold estimate
##D   
##D   predict(m2) # probability of each category
##D   detach("package:ordinal") # to avoid VarCorr clash with lme4
## End(Not run)




