library(hmmm)


### Name: hmmm.model.X
### Title: hmm model with covariates effect on parameters
### Aliases: hmmm.model.X
### Keywords: models

### ** Examples
data(accident)
y<-getnames(accident,st=9,sep=";")
# responses: 1 = Type, 2 = Time; covariates: 3 = Age, 4 = Hour

marginals<-marg.list(c("b-marg","marg-g","b-g"))
al<-list(
Type=~Type*(Age+Hour),
Time=~Time*(Age+Hour),
Type.Time=~Type.Time*(Age+Hour)
)
# model with additive effect of the covariates on logits and log-o.r. of the responses
model<-hmmm.model.X(marg=marginals,lev=c(3,4),names=c("Type","Time"),
Formula=al,strata=c(3,2),fnames=c("Age","Hour"))
mod<-hmmm.mlfit(y,model,y.eps=0.1)



