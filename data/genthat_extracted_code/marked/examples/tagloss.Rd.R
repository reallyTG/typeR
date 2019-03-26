library(marked)


### Name: tagloss
### Title: Tag loss example
### Aliases: tagloss
### Keywords: datasets

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
# get data; the beta parameters used to simulate the data were
# Phi: 2.197, p: -0.4064  Tau:-2,-1,3
data(tagloss)
# process data with double-tag CJS model and use perm field to create groups; 
# one half are permanently marked
dp=process.data(tagloss,model="hmmcjs2tl",groups="perm")
# create default design data
ddl=make.design.data(dp)
#set p=0 when the animal is not permanently marked if it goes to state 00 (both tags lost)
#which is equivalent to tag1=1 and tag2=1. The tag1, tag2 fields are created as part of default
#design data for p and tau.
#For p, there are 4 records for each occasion for each animal. The records are 
#for the 4 possible tag loss states: 11,10,01,00. For the first occasion an animal was
#seen, p=1 (fix=1).
tail(ddl$p)
#For tau, there are 4 records for each occasion for each animal. The records are 
#for the 4 possible tag loss states: 11,10,01,00. For state 11, tau=1 (fix=1) because
#a multinomial logit is used for this model. One of the values need to be fixed to 1
#to make the parameters identifiable because the probabilities sum to 1 for the 
#transitions to the tag states. 
tail(ddl$tau)
# For Phi there is a single record per occasion(interval) per animal.
tail(ddl$Phi)
# Animals that are not permanently marked cannot be seen in state 00 which is the 
# same as tag1==1 & tag2==1
ddl$p$fix[ddl$p$perm=="no"&ddl$p$tag1==1&ddl$p$tag2==1]=0
# First fit a model assuming tag loss does not vary for the 2 tags. In that case,
# the probability is beta for a single loss and 2*beta for double loss. We get that
# model using I(tag1+tag2) which has values 0,1,2. Note that for the tau 
# parameter the intercept is removed automatically. Also tag loss is independent in this
# model.
mod0=crm(dp,ddl,model.parameters=list(tau=list(formula=~I(tag1+tag2))),
        initial=list(Phi=2,p=.3,tau=c(-1)),hessian=TRUE)
# now fit a model allowing different loss rates for each tag but still independent
mod1=crm(dp,ddl,model.parameters=list(tau=list(formula=~tag1+tag2)),
        initial=list(Phi=2,p=.3,tau=c(-2,-1)),hessian=TRUE)
# now fit the model that was used to generate the data with dependence
mod2=crm(dp,ddl,model.parameters=list(tau=list(formula=~tag1+tag2+tag1:tag2)),
        initial=list(Phi=2,p=.3,tau=c(-2,-1,3)),hessian=TRUE)
# Now treat all as not permanently marked
tagloss$ch=gsub("--","0",tagloss$ch)
dp=process.data(tagloss,model="hmmcjs2tl")
ddl=make.design.data(dp)
ddl$p$fix[ddl$p$tag1==1&ddl$p$tag2==1]=0
mod3=crm(dp,ddl,model.parameters=list(tau=list(formula=~tag1+tag2)),
        initial=list(Phi=2,p=.3,tau=c(-2,-1)),hessian=TRUE)
# Model 2 is the best model but note that even though the tag loss model is
# incorrect in models 0 and 1 which assume independence, the survival estimate is
# only slightly less than for model 2. The model compensates by increasing the indiviudal
# tag loss rates to explain the observed 00's with the permanently marked animals.  Thus, if
# if you have enough marked animals you could end up with little bias in survival even if you 
# have the wrong tag loss model.
mod0
mod1
mod2
# Note in model 3, even though tag-loss specific rates are estimated correctly
# survival is biased low because tag loss was dependent in simulating data
# but was assumed to be independent in fitted model and because there are no -- observations,
# the model assumes what are unobserved excess 00's are dead, so the survival estimate will be
# negatively biased. Note the data are different and AIC not comparable to other models.
mod3
if(require(expm))
{
   tag_status=function(k,x) 
   {
	    mat=t(sapply(1:k,function(k,x) (x%^%k)[1,] ,x=x))
	    colnames(mat)=c("11","10","01","00","Dead")
	    rownames(mat)=1:k
	    return(mat)
    }
    par(mfrow=c(1,4))
    barplot(t(tag_status(4,mod0$results$mat$gamma[1,1,,])),
     beside=TRUE,ylim=c(0,1),main="mod0",legend.text=c("11","10","01","00","Dead"),
     args.legend=list(x=20,y=.9)) 
    barplot(t(tag_status(4,mod1$results$mat$gamma[1,1,,])),beside=TRUE,
                  ylim=c(0,1),main="mod1")
    barplot(t(tag_status(4,mod2$results$mat$gamma[1,1,,])),beside=TRUE,
                  ylim=c(0,1),main="mod2")
    barplot(t(tag_status(4,mod3$results$mat$gamma[1,1,,])),beside=TRUE,
                   ylim=c(0,1),main="mod3")
}
## End(No test)



