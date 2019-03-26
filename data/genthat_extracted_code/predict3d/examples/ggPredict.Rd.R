library(predict3d)


### Name: ggPredict
### Title: Visualize predictions from the multiple regression models.
### Aliases: ggPredict

### ** Examples

fit=loess(mpg~hp*wt*am,data=mtcars)
ggPredict(fit)
ggPredict(fit,hp)
ggPredict(fit,hp,wt)
fit=lm(mpg~hp*wt,data=mtcars)
ggPredict(fit)
ggPredict(fit,labels=paste0("label",1:3),xpos=c(0.3,0.6,0.4))
ggPredict(fit,se=TRUE)
ggPredict(fit,mode=3,colorn=40,show.text=FALSE)
## No test: 
fit=lm(mpg~hp*wt*cyl,data=mtcars)
ggPredict(fit,modx=wt,modx.values=c(2,3,4,5),mod2=cyl,show.text=FALSE)
ggPredict(fit,hp,wt,show.point=FALSE,se=TRUE,xpos=0.5)
ggPredict(fit,modx=wt,xpos=0.3)
ggPredict(fit)
mtcars$engine=ifelse(mtcars$vs==0,"V-shaped","straight")
fit=lm(mpg~wt*engine,data=mtcars)
ggPredict(fit)
require(TH.data)
fit=glm(cens~pnodes*horTh,data=GBSG2,family=binomial)
ggPredict(fit,pnodes,horTh,se=TRUE,xpos=c(0.6,0.3),angle=c(40,60),vjust=c(2,-0.5))
fit1=glm(cens~pnodes,data=GBSG2,family=binomial)
ggPredict(fit1,vjust=1.5,angle=45)
fit3=glm(cens~pnodes*age,data=GBSG2,family=binomial)
ggPredict(fit3,pred=pnodes,modx=age,mode=3,colorn=10,show.text=FALSE)
fit2=glm(cens~pnodes*age*horTh,data=GBSG2,family=binomial)
ggPredict(fit2,pred=pnodes,modx=age,mod2=horTh,mode=3,colorn=10,show.text=FALSE)
fit=lm(mpg~log(hp)*wt,data=mtcars)
ggPredict(fit,hp,wt)
## End(No test)



