library(hmmm)


### Name: recursive
### Title: recursive marginal interactions
### Aliases: recursive
### Keywords: logit

### ** Examples

data(kentucky)
# 1 = injury 2 = restraint 3 = year
y<-getnames(kentucky,st=4)

marglist<-marg.list(c("m-m-l","m-l-l","r-l-l"),mflag="m")
R1<-matrix(c(1,1,1,-1,-1,
             0,0,0,1,-1,
             1,1,-1,0,0,
             1,-1,0,0,0),4,5,byrow=TRUE)
# logits of recursive (or nested) type for variable 1:
# log p(injury<=3)/p(injury>3); log p(injury=4)/p(injury=5);
# log p(injury<=2)/p(injury=3); log p(injury=1)/p(injury=2);
rec<-recursive(R1,0,0) # only variable 1 has recursive logits 

# additive effect of variables 2,3 on the recursive logits of variable 1
model<-hmmm.model(marg=marglist,lev=c(5,2,5),sel=c(34:49),cocacontr=rec)
mod<-hmmm.mlfit(y,model)
print(mod,printflag=TRUE)



