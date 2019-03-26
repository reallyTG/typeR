## ----warning=FALSE,message=FALSE,eval=FALSE------------------------------
#  #install.packages("devtools")
#  devtools::install_github("cardiomoon/ggiraphExtra")

## ----warning=FALSE,message=FALSE-----------------------------------------
require(ggplot2)
require(ggiraph)
require(ggiraphExtra)

ggPoints(aes(x=wt,y=mpg,color=am),data=mtcars,method="lm",interactive=TRUE)

## ----message=FALSE,warning=FALSE-----------------------------------------
require(TH.data)
data(GBSG2)
ggPoints(aes(x=pnodes,y=cens),data=GBSG2,method="glm",interactive=TRUE)

## ----warning=FALSE,message=FALSE-----------------------------------------
ggRadar(data=iris,aes(color=Species),interactive=TRUE)
ggRadar(data=mtcars,aes(colour=am),interactive=TRUE)

## ----warning=FALSE,message=FALSE-----------------------------------------
require(moonBook)
ggSpine(data=acs,aes(x=age,fill=smoking),interactive=TRUE)
ggSpine(data=acs,aes(x=Dx,fill=smoking),addlabel=TRUE,interactive=TRUE)

## ----warning=FALSE,message=FALSE-----------------------------------------
ggBar(acs,aes(x=Dx,fill=smoking),addlabel=TRUE,horizontal=TRUE,width=0.5,interactive=TRUE)
ggBar(rose,aes(x=Month,fill=group,y=value),stat="identity",polar=TRUE,palette="Reds",width=1,
       color="black",size=0.1,interactive=TRUE)
ggBar(acs,aes(x=age,fill=smoking),addlabel=TRUE,horizontal=TRUE,width=0.5,interactive=TRUE)

## ----warning=FALSE,message=FALSE-----------------------------------------
ggPair(iris[3:5],interactive=TRUE)
ggPair(iris,aes(color=Species),horizontal=TRUE,interactive=TRUE)

## ----warning=FALSE,message=FALSE-----------------------------------------
ggPieDonut(acs,aes(pies=Dx,donuts=smoking),interactive=TRUE)
ggPieDonut(browsers,aes(pies=browser,donuts=version,count=share),interactive=TRUE)
ggDonut(browsers,aes(donuts=version,count=share),interactive=TRUE)

## ----warning=FALSE,message=FALSE-----------------------------------------
require(gcookbook)
mtcars$name=rownames(mtcars)
ggCLE(data=mtcars,aes(x=mpg,y=name,color=am,facet=am),interactive=TRUE)
ggCLE(data=tophitters2001,aes(x=avg,y=name,color=lg,facet=lg),no=20,interactive=TRUE)

