library(qrjoint)


### Name: summary.qrjoint
### Title: Summary Method for qrjoint Model Fit
### Aliases: summary.qrjoint
### Keywords: programming

### ** Examples
 
# Plasma data analysis

# recoding variables
data(plasma)
plasma$Sex <- as.factor(plasma$Sex)
plasma$SmokStat <- as.factor(plasma$SmokStat)
plasma$VitUse <- 3 - plasma$VitUse
plasma$VitUse <- as.factor(plasma$VitUse)

# Model fitting with 40 posterior samples from 80 iterations (thin = 2) is for
# illustration only. For practical model fitting, increase iterations, 
# e.g. nsamp = 500, thin = 20
fit.qrj <- qrjoint(BetaPlasma ~ Age + Sex + SmokStat + Quetelet + VitUse + Calories + 
        Fat + Fiber + Alcohol + Cholesterol + BetaDiet, plasma, nsamp = 40, thin = 2)
summ <- summary(fit.qrj, more = TRUE)

## Not run: 
##D # Visually assess uniformity of response proportions with histogram and qqplot
##D # Notes: Can assess across all MCMC draws (as below) or for single iteration;
##D # adjustments to response proportions will be needed for censored observations
##D hist(summ$rp, breaks=40, freq=F)
##D curve(dunif(x),add=T)
##D qqplot(summ$rp, qunif(ppoints(length(summ$rp))),xlab="actual", ylab="theoretical")
##D abline(0,1)
##D 
##D # Visually assess linearity assumption using response proportions
##D # Notes: Can assess across all MCMC draws or for single iteration (as below)
##D 
##D # Loess gives visual of center of response proportions across covariate;
##D # trend line should be near 0.5
##D library(ggplot2)
##D use <- sample(1:ncol(summ$rp),1)
##D plasma$rpsamp <- summ$rp[,use]
##D ggplot(data=plasma, aes(x=Age, y=rpsamp)) + geom_point() + geom_smooth(se=F, 
##D method="loess")
##D 
##D # Violin plot allows for assessment of entire distribution across covariate;
##D # densities within decile bins should be blocky-uniform 
##D cut_dec <- function(x) factor(cut(x, quantile(x,0:10/10),inc=TRUE),labels=1:10)
##D ggplot(data=plasma, aes(x=cut_dec(Age), y=rpsamp)) + geom_violin() + 
##D xlab("Age Decile Bins")
## End(Not run)




