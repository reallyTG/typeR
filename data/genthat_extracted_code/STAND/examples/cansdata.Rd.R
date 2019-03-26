library(STAND)


### Name: cansdata
### Title: Container Data Used To Evaluate Beryllium Surface Contamination
### Aliases: cansdata
### Keywords: datasets

### ** Examples

data(cansdata)
#     subset container data into stratum A and stratum B
sa60 <- cansdata[ cansdata$st=="A",] ; Ia <- "Be Samples From  Stratum A"
sb60 <- cansdata[ cansdata$st=="B",] ; Ib <- "Be Samples From  Stratum B"
mle.sa60 <- unlist(lnorm.ml(sa60))  # MLEs for stratum A
mle.sb60 <- unlist(lnorm.ml(sb60)) 
#     print MLE for stratum A and B
round( data.frame(mle.sa60,mle.sb60),3)
#
# Q-Q plot for each stratum
par( mfcol=c(1,2) )
qq.lnorm(plend(sa60),mle.sa60[1,2],ylim=c(0.01,1.2),xlim=c(-0.5,2.5),main=Ia )
qq.lnorm(plend(sb60),mle.sb60[1,2],ylim=c(0.01,1.2),xlim=c(-0.5,2.5),main=Ib )
#   list all summary statistics by Strata
round(IH.summary(cansdata,L=0.2,bcol=3),4)



