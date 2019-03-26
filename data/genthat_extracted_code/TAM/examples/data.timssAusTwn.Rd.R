library(TAM)


### Name: data.timssAusTwn
### Title: Dataset TIMSS 2011 of Australian and Taiwanese Students
### Aliases: data.timssAusTwn data.timssAusTwn.scored
### Keywords: datasets

### ** Examples

data(data.timssAusTwn)
raw_resp <- data.timssAusTwn

#Recode data
resp <- raw_resp[,1:11]
      #Column 12 is country code. Column 13 is gender code. Column 14 is Book ID.
all.na <- rowMeans( is.na(resp) )==1
        #Find records where all responses are missing.
resp <- resp[!all.na,]              #Delete records with all missing responses
resp[resp==20 | resp==21] <- 2      #TIMSS double-digit coding: "20" or "21" is a score of 2
resp[resp==10 | resp==11] <- 1      #TIMSS double-digit coding: "10" or "11" is a score of 1
resp[resp==70 | resp==79] <- 0      #TIMSS double-digit coding: "70" or "79" is a score of 0
resp[resp==99] <- 0                 #"99" is omitted responses. Score it as wrong here.
resp[resp==96 | resp==6] <- NA      #"96" and "6" are not-reached items. Treat these as missing.

#Score multiple-choice items        #"resp" contains raw responses for MC items.
Scored <- resp
Scored[,9] <- (resp[,9]==4)*1       #Key for item 9 is D.
Scored[,c(1,2)] <- (resp[,c(1,2)]==2)*1  #Key for items 1 and 2 is B.
Scored[,c(10,11)] <- (resp[,c(10,11)]==3)*1  #Key for items 10 and 11 is C.

#Run IRT analysis for partial credit model (MML estimation)
mod1 <- TAM::tam.mml(Scored)

#Item parameters
mod1$xsi

#Thurstonian thresholds
tthresh <- TAM::tam.threshold(mod1)
tthresh

## Not run: 
##D #Plot Thurstonian thresholds
##D windows (width=8, height=7)
##D par(ps=9)
##D dotchart(t(tthresh), pch=19)
##D # plot expected response curves
##D plot( mod1, ask=TRUE)
##D 
##D #Re-run IRT analysis in JML
##D mod1.2 <- TAM::tam.jml(Scored)
##D stats::var(mod1.2$WLE)
##D 
##D #Re-run the model with "not-reached" coded as incorrect.
##D Scored2 <- Scored
##D Scored2[is.na(Scored2)] <- 0
##D 
##D #Prepare anchor parameter values
##D nparam <- length(mod1$xsi$xsi)
##D xsi <- mod1$xsi$xsi
##D anchor <- matrix(c(seq(1,nparam),xsi), ncol=2)
##D 
##D #Run IRT with item parameters anchored on mod1 values
##D mod2 <- TAM::tam.mml(Scored2, xsi.fixed=anchor)
##D 
##D #WLE ability estimates
##D ability <- TAM::tam.wle(mod2)
##D ability
##D 
##D #CTT statistics
##D ctt <- TAM::tam.ctt(resp, ability$theta)
##D write.csv(ctt,"TIMSS_CTT.csv")
##D 
##D #plot histograms of ability and item parameters in the same graph
##D windows(width=4.45, height=4.45, pointsize=12)
##D layout(matrix(c(1,1,2),3,byrow=TRUE))
##D layout.show(2)
##D hist(ability$theta,xlim=c(-3,3),breaks=20)
##D hist(tthresh,xlim=c(-3,3),breaks=20)
##D 
##D #Extension
##D #Score equivalence table
##D dummy <- matrix(0,nrow=16,ncol=11)
##D dummy[lower.tri(dummy)] <- 1
##D dummy[12:16,c(3,4,7,8)][lower.tri(dummy[12:16,c(3,4,7,8)])]<-2
##D 
##D mod3 <- TAM::tam.mml(dummy, xsi.fixed=anchor)
##D wle3 <- TAM::tam.wle(mod3)
## End(Not run)



