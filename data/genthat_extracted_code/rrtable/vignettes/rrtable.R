## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE ,message=FALSE,warning=FALSE,comment=NA,
          fig.width=9,fig.asp=0.618,fig.align='center',out.width='70%')

## ----echo= TRUE ,message=FALSE-------------------------------------------
require(moonBook)
require(ztable)
require(rrtable)
require(ggplot2)
options(ztable.type='HTML')

## ----echo=TRUE, eval=FALSE-----------------------------------------------
#  if(!require(devtools)){ install.packages("devtools") }
#  devtools::install_github("cardiomoon/rrtable")

## ----echo=TRUE-----------------------------------------------------------
require(rrtable) 

## ----echo=TRUE, eval=TRUE------------------------------------------------
str(sampleData3) 

## ----results='asis'------------------------------------------------------
df2flextable2( sampleData3 ,vanilla= FALSE )

## ----results='asis'------------------------------------------------------
mytable2flextable( mytable(Dx~.,data=acs) ,vanilla= FALSE )

## ------------------------------------------------------------------------
plot(Sepal.Width~Sepal.Length,data=iris) 

## ------------------------------------------------------------------------
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,color=Species))+ geom_point() 

## ----echo=TRUE-----------------------------------------------------------
fit=lm(mpg~wt*hp,data=mtcars)
summary(fit) 

## ----out.width='45%',fig.align='default',fig.show='hold'-----------------
ggplot(iris,aes(Sepal.Length,Sepal.Width))+geom_point()
ggplot(iris,aes(Sepal.Length,Sepal.Width,colour=Species))+ geom_point()+guides(colour=FALSE) 

## ----out.width='45%',fig.align='default',fig.show='hold'-----------------
hist(rnorm(1000))
plot(1:10) 

## ----echo=TRUE, eval=FALSE-----------------------------------------------
#  data2HTML(sampleData3)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  data2docx(sampleData3)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  data2docx(sampleData2)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  data2pptx(sampleData3)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  data2pptx(sampleData2)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  data2pdf(sampleData3)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  data2pdf(sampleData2)

