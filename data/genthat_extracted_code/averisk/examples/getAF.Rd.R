library(averisk)


### Name: getAF
### Title: Calculate average attributable fractions
### Aliases: getAF
### Keywords: getAF

### ** Examples

# the following example is from Eide and Gefeller, 1995
# simulate data

ex_probs <- c(.06732,.02976,.01570,.01787,.01445,.01008,.06986,.06553,.03,.05766,
             .09680,.04194,.02741,.02194,.02474,.01031,.12410,.09537,.08408,.09509) # P(E|D)
disease_probs <- c(.036,.0621,.0236,.0411,.0507,.0864,.1066,.1745,.1867,.2891,.0514,
             .0875,.0339,.0584,.0718,.1206,.1474,.2345,.2497,.3708) # P(D|E)
pe <- ex_probs/disease_probs ## marginal P(E)
pe <- pe/sum(pe)
nond_exposure_probs <- (1-disease_probs)*pe  # P(E|not D)
nond_exposure_probs <- nond_exposure_probs/sum(nond_exposure_probs)
ex_probs <- ex_probs/sum(ex_probs)
the.mat <- cbind(c(rep(0,10),rep(1,10)),rep(rep(1:5,each=2),2),rep(c(0,1),10))
ncase <- 500
ncontrol <- 500
casemat <- the.mat[sample(1:20,size=ncase,replace=TRUE,prob=ex_probs),]
case_rows <- cbind(rep(1,ncase),casemat)
controlmat <- the.mat[sample(1:20,size=ncase,replace=TRUE,prob=nond_exposure_probs),]
control_rows <- cbind(rep(0,ncontrol),controlmat)
the.d <- rbind(case_rows,control_rows)
colnames(the.d) <- c("y","urban.rural","smoking.category","occupational.exposure")

# Just get the estimate (no confidence interval)
getAF(y~urban.rural+smoking.category+occupational.exposure,the.d,prev=0.09)

## find the average fraction and associated monte-carlo calculated 99% confidence 
##  No need for approximation here.  Assume population prevalence is 9 percent.


getAF(y~urban.rural+smoking.category+occupational.exposure,the.d,prev=0.09,ci=TRUE,conf_level=0.99)


## genetic simulation using more risk factors (disease prevalence = 0.01)  might be slow.

## Not run: 
##D thevec <- dbinom(0:40, size= 40, prob=0.2, log = FALSE)
##D bin_fun <- function(beta_0){
##D  sum(thevec*exp(beta_0+.1*(0:40))/(1+exp(beta_0+.1*(0:40))))-0.01
##D }
##D beta_0 <- uniroot(bin_fun,lower=-8,upper=5)$root
##D total_risk <- (0.01-exp(beta_0)/(1+exp(beta_0)))/0.01
##D risk_per_snp <- total_risk/20
##D case_probabilities <- (thevec*exp(beta_0 + (0:40)*0.1)/(1+exp(beta_0 + (0:40)*0.1)))/0.01
##D control_probabilities <- thevec*1/(1+exp(beta_0 + (0:40)*0.1))/0.99
##D simdata_genetic <- function(ncase,ncontrol){ 
##D numbersnps_case <- sample(0:40,ncase,prob=case_probabilities,replace=TRUE)
##D  numbersnps_control <- sample(0:40,ncase,prob=control_probabilities,replace=TRUE)
##D  case_rows <- cbind(rep(1,ncase),matrix(0,nrow=ncase,ncol=20))
##D  control_rows <- cbind(rep(0,ncase),matrix(0,nrow=ncontrol,ncol=20))
##D  for(i in 1:ncase){
##D    if(numbersnps_case[i]>0){   
##D      positions <- sample(1:40,numbersnps_case[i])  
##D      positions <- ceiling(positions/2)
##D     for(j in 1:length(positions)) case_rows[i,positions[j]+1] <- case_rows[i,positions[j]+1]+1
##D    }
##D  }
##D  for(i in 1:ncontrol){
##D    if(numbersnps_control[i]>0){   
##D      positions <- sample(1:40,numbersnps_control[i])
##D      positions <- ceiling(positions/2)
##D      for(j in 1:length(positions)){
##D          control_rows[i,positions[j]+1]<- control_rows[i,positions[j]+1]+1 
##D      }                                                       
##D    }
##D }
##D  return(rbind(case_rows,control_rows))
##D }
##D the.d <- simdata_genetic(ncase=250, ncontrol=250)
##D colnames(the.d) <- c("y",paste("SNP",1:20,sep=""))
##D 
##D ## Here we just calculate the approximate average fraction
##D ## from 50 permutations and no confidence interval.
##D ## If CI desired add the argument ci=TRUE and nsample_var to the function. 
##D ## 50 permuations is chosen for speed. In reality, 1000 maybe needed
##D 
##D thesnp <- paste0("SNP", 1:20,sep="")
##D (fmla <- as.formula(paste("y ~ ", paste(thesnp, collapse= "+"))))
##D getAF(fmla, the.d,prev=0.01, allperm=FALSE,nsample_perm=50,ci=FALSE)
##D 
##D ## Instead of specifying the number of permutations, 
##D ## you can specify an estimated approximation error. 
##D ## The approximation error will be within this bound with 95% confidence 
##D ## approximation error of 0.01 specified for reasons of speed.
##D ## In reality, you may want to use a smaller value for approx_error.
##D 
##D getAF(fmla, the.d,prev=0.01, allperm=FALSE,approx_error=0.01,ci=FALSE)
## End(Not run)



