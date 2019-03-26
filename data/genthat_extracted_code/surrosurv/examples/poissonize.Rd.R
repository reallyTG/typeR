library(surrosurv)


### Name: poissonize
### Title: Tranform survival data for fitting a Poisson model
### Aliases: poissonize plotsson
### Keywords: Poisson Survival data

### ** Examples

################################################################################
# Example 1 - KIDNEY data                                                      #
################################################################################
library(survival)
data(kidney)
kidney <- kidney[1:(nrow(kidney)/2)*2,]
head(kidney) 

par(mfrow=c(1, 3))
for (int in c(50, 20, 10)) {
    head(wdata1 <- poissonize(kidney, interval.width = int, 
                              factors = c('disease'), compress = FALSE))
    head(wdata2 <- poissonize(kidney, interval.width = int, 
                              factors = c('disease'), compress = TRUE))
    
    fitcox <- (coxph(Surv(time, status) ~ disease, data = kidney))
    fitpoi1 <- glm(event ~ -1 + interval + disease + offset(log(time)),
                   data = wdata1, family = 'poisson')
    fitpoi2 <- glm(m ~ -1 + interval + offset(log(Rt)) + disease,
                   data = wdata2, family = 'poisson')
    cox.base <- basehaz(fitcox, centered = FALSE)
    plot(stepfun(cox.base$time[-nrow(cox.base)], exp(-cox.base$hazard)),
         ylim = 0:1, xlim = c(0, max(cox.base$time)),
         do.points = FALSE, verticals = FALSE, xaxs = 'i',
         main = paste0('KIDNEY data set\nInterval width = ', int),
         xlab = 'Time', ylab = 'Survival probability')
    plotsson(fitpoi1, 'Surv', add = TRUE, col = 2, lty = 2)
    plotsson(fitpoi2, 'Surv', add = TRUE, col = 3, lty = 3) 
    legend('topright', col = 1:3, lty = 1:3,
           legend = c('Breslow (Cox)', 'Poisson',
                      'Poisson (compressed dataset)'))
}
print(cbind(Cox                = coef(fitcox),
            Poisson            = rev(rev(coef(fitpoi1))[1:3]),
            Poisson_Compressed = rev(rev(coef(fitpoi2))[1:3])), digits = 2)



################################################################################
#  Example 2 - COLON data                                                      #
################################################################################
library(survival)
data(colon)
head(wdata1 <- poissonize(subset(colon, etype == 1), interval.width = 365.25, 
                          factors=c('surg', 'sex', 'age'), compress = FALSE))
head(wdata2 <- poissonize(subset(colon, etype == 1), interval.width = 365.25, 
                          factors=c('surg', 'sex', 'age'), compress = TRUE))

fitcox <- coxph(Surv(time, status) ~ surg + sex + age, 
                data = subset(colon, etype == 1))

system.time({
    fitpoi1 <- glm(event ~ -1 + interval + surg + sex + age + offset(log(time)),
                   data = wdata1, fam = 'poisson')
})
system.time({
    fitpoi2 <- glm(m ~ -1 + interval + offset(log(Rt)) + surg + sex + age,
                   data = wdata2, family = 'poisson')
})
{
    cox.base <- basehaz(fitcox, centered = FALSE)
    par(mfrow = c(1, 1))
    plot(stepfun(cox.base$time[-nrow(cox.base)], exp(-cox.base$hazard)),
         ylim = 0:1, xlim = c(0, max(cox.base$time)),
         do.points = FALSE, verticals = FALSE, xaxs = 'i',
         main = 'COLON data set', xlab = 'Time', ylab = 'Survival probability')
    plotsson(fitpoi1, 'Surv', add = TRUE, col = 2, lty = 2) 
    plotsson(fitpoi2, 'Surv', add = TRUE, col = 3, lty = 3) 
    legend('topright', col = 1:3, lty = 1:3,
           legend = c('Cox', 'Poisson', 'Poisson (compressed dataset)'))
}
print(cbind(Cox                = coef(fitcox),
            Poisson            = rev(rev(coef(fitpoi1))[1:3]),
            Poisson_Compressed = rev(rev(coef(fitpoi2))[1:3])), digits = 2)



################################################################################
#  Example 3 - LUNG data                                                       #
################################################################################
library(survival)
data(lung)
lung$status <- lung$status - 1
lung$id <- 1:nrow(lung)
head(wdata1 <- poissonize(lung, interval.width = 365.25/12, 
                          factors = c('pat.karno', 'sex', 'age'), 
                          compress = FALSE))
head(wdata2 <- poissonize(lung, interval.width = 365.25/12,
                          factors = c('pat.karno', 'sex', 'age'),
                          compress = TRUE))

fitcox <- coxph(Surv(time, status) ~ pat.karno + sex + age, data = lung)

system.time({
    fitpoi1 <- glm(event ~ -1 + interval + pat.karno + sex + age + 
                              offset(log(time)),
                   data = wdata1, family = 'poisson')
})
system.time({
    fitpoi2 <- glm(m ~ -1 + interval + pat.karno + sex + age + offset(log(Rt)),
                   data = wdata2, family = 'poisson')
})
{
    cox.base <- basehaz(fitcox, centered = FALSE)
    plot(stepfun(cox.base$time[-nrow(cox.base)], exp(-cox.base$hazard)),
         ylim = 0:1, xlim = c(0, max(cox.base$time)),
         do.points = FALSE, verticals = FALSE, xaxs = 'i',
         main = 'LUNG data set', xlab = 'Time', ylab = 'Survival probability')
    plotsson(fitpoi1, 'Surv', add = TRUE, col = 2, lty = 2) 
    plotsson(fitpoi2, 'Surv', add = TRUE, col = 3, lty = 3) 
    legend('topright', col = 1:3, lty = 1:3,
           legend = c('Cox', 'Poisson', 'Poisson (compressed dataset)'))
}
print(cbind(Cox                = coef(fitcox),
            Poisson            = rev(rev(coef(fitpoi1))[1:3]),
            Poisson_Compressed = rev(rev(coef(fitpoi2))[1:3])), digits = 2)




