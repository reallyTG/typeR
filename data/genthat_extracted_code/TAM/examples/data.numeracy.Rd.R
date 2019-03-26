library(TAM)


### Name: data.numeracy
### Title: Dataset Numeracy
### Aliases: data.numeracy
### Keywords: datasets

### ** Examples

######################################################################
# (1) Scored numeracy data
######################################################################

data(data.numeracy)
dat <- data.numeracy$scored

#Run IRT analysis: Rasch model
mod1 <- TAM::tam.mml(dat)

#Item difficulties
mod1$xsi
ItemDiff <- mod1$xsi$xsi
ItemDiff

#Ability estimate - Weighted Likelihood Estimate
Abil <- TAM::tam.wle(mod1)
Abil
PersonAbility <- Abil$theta
PersonAbility

#Descriptive statistics of item and person parameters
hist(ItemDiff)
hist(PersonAbility)
mean(ItemDiff)
mean(PersonAbility)
stats::sd(ItemDiff)
stats::sd(PersonAbility)

## Not run: 
##D #Extension
##D #plot histograms of ability and item parameters in the same graph
##D oldpar <- par(no.readonly=TRUE)          # save writable default graphic settings
##D windows(width=4.45, height=4.45, pointsize=12)
##D layout(matrix(c(1,1,2),3,byrow=TRUE))
##D layout.show(2)
##D hist(PersonAbility,xlim=c(-3,3),breaks=20)
##D hist(ItemDiff,xlim=c(-3,3),breaks=20)
##D 
##D par( oldpar )  # restore default graphic settings
##D hist(PersonAbility,xlim=c(-3,3),breaks=20)
##D 
##D ######################################################################
##D # (2) Raw numeracy data
##D ######################################################################
##D 
##D raw_resp <- data.numeracy$raw
##D 
##D #score responses
##D key <- c(1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1)
##D scored <- sapply( seq(1,length(key)),
##D             FUN=function(ii){ 1*(raw_resp[,ii]==key[ii]) } )
##D 
##D #run IRT analysis
##D mod1 <- TAM::tam.mml(scored)
##D 
##D #Ability estimate - Weighted Likelihood Estimate
##D Abil <- TAM::tam.wle(mod1)
##D 
##D #CTT statistics
##D ctt1 <- TAM::tam.ctt(raw_resp, Abil$theta)
##D write.csv(ctt1,"D1_ctt1.csv")       # write statistics into a file
##D         # use maybe write.csv2 if ';' should be the column separator
##D 
##D #Fit statistics
##D Fit <- TAM::tam.fit(mod1)
##D Fit
##D 
##D # plot expected response curves
##D plot( mod1, ask=TRUE )
## End(Not run)



