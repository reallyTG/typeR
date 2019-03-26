library(vtable)


### Name: vtable
### Title: Variable Table Function
### Aliases: vtable

### ** Examples

## Don't show: 
#These tests use the out='htmlreturn' option
#so that the same process of generating HTML is followed
#but a browser window is not opened during testing.
#This process is identical to regular operation except that
#HTML is written to the R output rather than a browser.
df <- data.frame(var1 = 1:4,var2=5:8,var3=c('A','B','C','D'),
    var4=as.factor(c('A','B','C','C')),var5=c(TRUE,TRUE,FALSE,FALSE))

#Demonstrating different options:
vtable(df,labels=c('Number 1','Number 2','Some Letters',
    'Some Labels','You Good?'),
    out='htmlreturn')
vtable(subset(df,select=c(1,2,5)),
    labels=c('Number 1','Number 2','You Good?'),class=FALSE,values=FALSE,
    out='htmlreturn')
vtable(subset(df,select=c('var1','var4')),
    labels=c('Number 1','Some Labels'),
    factor.limit=1,col.width=c(10,10,40,35),
    out='htmlreturn')

#Different methods of applying variable labels:
labelsmethod2 <- data.frame(var1='Number 1',var2='Number 2',
    var3='Some Letters',var4='Some Labels',var5='You Good?')
vtable(df,labels=labelsmethod2,out='htmlreturn')
labelsmethod3 <- data.frame(a =c("var1","var2","var3","var4","var5"),
    b=c('Number 1','Number 2','Some Letters','Some Labels','You Good?'))
vtable(df,labels=labelsmethod3,out='htmlreturn')

#Using value labels and pre-labeled data:
library(sjlabelled)
df <- set_label(df,c('Number 1','Number 2','Some Letters',
    'Some Labels','You Good?'))
df$var1 <- set_labels(df$var1,labels=c('A little','Some more',
'Even more','A lot'))
vtable(df,out='htmlreturn')

#efc is data with embedded variable and value labels from the sjlabelled package
library(sjlabelled)
data(efc)
vtable(efc,out='htmlreturn')

#Adding summary statistics for variable mean and proportion of data that is missing.
vtable(efc,summ=c('mean(x)','propNA(x)'),out='htmlreturn')

## End(Don't show)
if(interactive()){
df <- data.frame(var1 = 1:4,var2=5:8,var3=c('A','B','C','D'),
    var4=as.factor(c('A','B','C','C')),var5=c(TRUE,TRUE,FALSE,FALSE))

#Demonstrating different options:
vtable(df,labels=c('Number 1','Number 2','Some Letters',
    'Some Labels','You Good?'))
vtable(subset(df,select=c(1,2,5)),
    labels=c('Number 1','Number 2','You Good?'),class=FALSE,values=FALSE)
vtable(subset(df,select=c('var1','var4')),
    labels=c('Number 1','Some Labels'),
    factor.limit=1,col.width=c(10,10,40,35))

#Different methods of applying variable labels:
labelsmethod2 <- data.frame(var1='Number 1',var2='Number 2',
    var3='Some Letters',var4='Some Labels',var5='You Good?')
vtable(df,labels=labelsmethod2)
labelsmethod3 <- data.frame(a =c("var1","var2","var3","var4","var5"),
    b=c('Number 1','Number 2','Some Letters','Some Labels','You Good?'))
vtable(df,labels=labelsmethod3)

#Using value labels and pre-labeled data:
library(sjlabelled)
df <- set_label(df,c('Number 1','Number 2','Some Letters',
    'Some Labels','You Good?'))
df$var1 <- set_labels(df$var1,labels=c('A little','Some more',
'Even more','A lot'))
vtable(df)

#efc is data with embedded variable and value labels from the sjlabelled package
library(sjlabelled)
data(efc)
vtable(efc)

#Adding summary statistics for variable mean and proportion of data that is missing.
vtable(efc,summ=c('mean(x)','propNA(x)'))

}



