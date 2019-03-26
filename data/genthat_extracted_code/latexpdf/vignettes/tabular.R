### R code from vignette source 'tabular.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: sample
###################################################
x <- data.frame(
  study=c(rep('PROT01',5),NA),
  subject=rep(c(1001,1002),each=3),
  time=c(0,1,2,0,1,2),
  conc=c(0.12,34,5.6,.5,200,NA)
)
x


###################################################
### code chunk number 2: tabular.Rnw:73-75
###################################################
library(latexpdf)
writeLines(as.ltable(x))


###################################################
### code chunk number 3: tabular.Rnw:77-78
###################################################
writeLines(as.ltable(x,environments=NULL))


###################################################
### code chunk number 4: tabular.Rnw:80-81
###################################################
writeLines(as.ltable(x,caption='Plasma Concentrations',label='pctab'))


###################################################
### code chunk number 5: tabular.Rnw:83-84
###################################################
writeLines(as.ltable(x,caption='Plasma Concentrations',cap.top=FALSE))


###################################################
### code chunk number 6: tabular.Rnw:86-87
###################################################
writeLines(as.ltable(x,grid=TRUE,caption='grid is TRUE'))


###################################################
### code chunk number 7: tabular.Rnw:89-90
###################################################
writeLines(as.ltable(x,grid=TRUE,caption='Includes Walls',walls=1,rules=c(1,2,1)))


###################################################
### code chunk number 8: tabular.Rnw:92-95
###################################################
writeLines(as.ltable(x,grid=TRUE,caption='Custom Breaks',
    colbreaks=c(0,2,0),rowgroups=x$subject
))


###################################################
### code chunk number 9: tabular.Rnw:97-100
###################################################
writeLines(as.ltable(x,grid=TRUE,caption='Custom Justify',
    numjust='left',charjust='right'
))


###################################################
### code chunk number 10: tabular.Rnw:101-104
###################################################
writeLines(as.ltable(x,grid=TRUE,caption='Decimal Align',
    justify=c('center','left','right','decimal')
))


###################################################
### code chunk number 11: tabular.Rnw:105-109
###################################################
writeLines(as.ltable(x,grid=TRUE,caption='Not Verbatim',
    justify=c('center','left','right','decimal'),
    verbatim=FALSE
))


###################################################
### code chunk number 12: tabular.Rnw:110-114
###################################################
writeLines(as.ltable(x,grid=TRUE,caption='Custom Column Width',
    justify=c('center','left','right','decimal'),
    colwidth=c(NA,NA,NA,'2cm')
))


###################################################
### code chunk number 13: tabular.Rnw:115-116
###################################################
writeLines(as.ltable(x,caption='Row Colors',rowcolors=c('white','lightgray')))


###################################################
### code chunk number 14: tabular.Rnw:118-127
###################################################
writeLines(
  as.ltable(
    x,
    caption='Row Groups',
    rowgroups=as.character(x$subject),
    rowgrouplabel='groups',
    rowgrouprule = 2
  )
)


###################################################
### code chunk number 15: tabular.Rnw:129-136
###################################################
writeLines(
  as.ltable(
    x,
    caption='Column Groups',
    colgroups=c('demographic','demographic','clinical','clinical')
  )
)


###################################################
### code chunk number 16: tabular.Rnw:138-148
###################################################
writeLines(
  as.ltable(
    x,
    caption='Row and Column Groups',
    rowgroups=as.character(x$subject),
    colgroups=c('demographic','demographic','clinical','clinical'),
    rowgrouprule = 1,
    grid=TRUE
  )
)


