## ----echo=FALSE,results='hide',warning=FALSE,message=FALSE------------------------------------------------------------------------------------------
library(knitr)
knitr::opts_chunk$set(comment="", message=FALSE, warning=FALSE,fig.align="center",fig.height=10,fig.width=10,tidy=TRUE,tidy.opts=list(blank=FALSE, width.cutoff=1200))
options(width=150)
library(kableExtra)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
library(compareGroups)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
data(predimed)

## ----echo=FALSE,results="asis"----------------------------------------------------------------------------------------------------------------------
dicc <- data.frame(
"Name"=I(names(predimed)),
"Label"=I(unlist(lapply(predimed, Hmisc::label))),
"Codes"=I(unlist(lapply(predimed, function(x) paste(levels(x),collapse="; "))))
)
dicc$Codes <- sub(">=","$\\\\geq$",dicc$Codes)
print(xtable(dicc,align=rep("l",4)),include.rownames=FALSE,type="html")

## ---------------------------------------------------------------------------------------------------------------------------------------------------
predimed$tmain <- with(predimed, Surv(toevent, event == 'Yes'))
Hmisc::label(predimed$tmain) <- "AMI, stroke, or CV Death"

## ---- results='hide'--------------------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ . , data=predimed)

## ---- results='hide'--------------------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ . -toevent - event, data=predimed)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(group ~ age + sex + smoke + waist + hormo, data=predimed)
res

## ---------------------------------------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ age + smoke + waist + hormo, data=predimed, subset = sex=='Female')

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ age + sex + smoke + waist + hormo, data=predimed, selec = list(hormo= sex=="Female", waist = waist>20 ))

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ age + smoke + waist + hormo, data=predimed, selec = list(waist= !is.na(hormo)), subset = sex=="Female")

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ age + sex + bmi + bmi + waist + hormo, data=predimed, selec = list(bmi.1=!is.na(hormo)))

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ age + smoke + waist + hormo, data=predimed, method = c(waist=2))

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ age + smoke + waist + hormo, data=predimed, method = c(waist=NA), alpha= 0.01)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
predimed$age7gr<-as.integer(cut(predimed$age, breaks=c(-Inf,55,60,65,70,75,80,Inf), right=TRUE))
compareGroups(group ~ age7gr, data=predimed, method = c(age7gr=NA))
compareGroups(group ~ age7gr, data=predimed, method = c(age7gr=NA), min.dis=8)

## ----eval=FALSE-------------------------------------------------------------------------------------------------------------------------------------
#  compareGroups(age7gr ~ sex + bmi + waist , data=predimed)

## ----echo=FALSE-------------------------------------------------------------------------------------------------------------------------------------
cat("Error en compareGroups.default(X = X, y = y, include.label = include.label,  :
number of groups must be less or equal to 5
")

## ----echo=TRUE--------------------------------------------------------------------------------------------------------------------------------------
compareGroups(age7gr ~ sex + bmi + waist, data=predimed, max.ylev=7)

## ---- echo=TRUE, eval=FALSE-------------------------------------------------------------------------------------------------------------------------
#  compareGroups(group ~ sex + age7gr, method= (age7gr=3), data=predimed, max.xlev=5)

## ----echo=FALSE-------------------------------------------------------------------------------------------------------------------------------------
cat("Warning in compareGroups.default(X = X, y = y, include.label = include.label,  :
Variables 'age7gr' have been removed since some errors ocurred
")

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ age + smoke + waist + hormo, data=predimed, include.label= FALSE)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
resu1<-compareGroups(group ~ age + waist, data=predimed, method = c(waist=2))
createTable(resu1)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
resu2<-compareGroups(group ~ age + smoke + waist + hormo, data=predimed, method = c(waist=2), Q1=0.025, Q3=0.975)
createTable(resu2)

## ---- echo=TRUE, results='hide'---------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ age + smoke + waist + hormo, data=predimed, method = c(waist=2), Q1=0, Q3=1)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
predimed$smk<-predimed$smoke
levels(predimed$smk)<- c("Never smoker", "Current or former < 1y", "Never or former >= 1y", "Unknown")
Hmisc::label(predimed$smk)<-"Smoking 4 cat."
cbind(table(predimed$smk))

## ---- eval=FALSE------------------------------------------------------------------------------------------------------------------------------------
#  compareGroups(group ~ age + smk + waist + hormo, data=predimed)

## ----echo=FALSE-------------------------------------------------------------------------------------------------------------------------------------
cat("
-------- Summary of results by groups of 'Intervention group'---------


  var                         N    p.value method            selection
1 Age                         6324 0.001** continuous normal ALL      
2 Smoking 4 cat.              6324 0.714   categorical       ALL      
3 Waist circumference         6324 0.019** continuous normal ALL      
4 Hormone-replacement therapy 5650 0.859   categorical       ALL      
-----
Signif. codes:  0 '**' 0.05 '*' 0.1 ' ' 1 

Warning message:
In compare.i(X[, i], y = y, selec.i = selec[i], method.i = method[i],  :
  Some levels of 'smk' are removed since no observation in that/those levels
")

## ---- echo=TRUE, results='hide'---------------------------------------------------------------------------------------------------------------------
compareGroups(group ~ age + smk, data=predimed, simplify=FALSE)

## ---- echo=FALSE------------------------------------------------------------------------------------------------------------------------------------
cat("
-------- Summary of results by groups of 'Intervention group'---------


  var            N    p.value method            selection
1 Age            6324 0.001** continuous normal ALL      
2 Smoking 4 cat. 6324 .       categorical       ALL      
-----
Signif. codes:  0 '**' 0.05 '*' 0.1 ' ' 1 

Warning messages:
1: In chisq.test(obj, simulate.p.value = TRUE) :
  cannot compute simulated p-value with zero marginals
2: In chisq.test(obj, simulate.p.value = TRUE) :
  Chi-squared approximation may be incorrect
")

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(group ~ age + sex + smoke + waist + hormo, method = c(waist=2), data=predimed)
summary(res[c(1, 2, 4)])

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
plot(res[c(1,2)], file="./figures/univar/", type="png")

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
plot(res[c(1,2)], bivar=TRUE, file="./figures/bivar/", type="png")

## ---------------------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(group ~ age + sex + smoke + waist + hormo, data=predimed)
res

## ---- echo=TRUE, results='hide'---------------------------------------------------------------------------------------------------------------------
res<-update(res, . ~. - sex +  bmi + toevent, subset = sex=='Female', method = c(waist=2, tovent=2), selec = list(bmi=!is.na(hormo)))
res

## ---------------------------------------------------------------------------------------------------------------------------------------------------
library(SNPassoc)
data(SNPs)
tab <- createTable(compareGroups(casco ~ snp10001 + snp10002 + snp10005 + snp10008 + snp10009, SNPs))
pvals <- getResults(tab, "p.overall")
p.adjust(pvals, method = "BH")

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
res1<-compareGroups(htn ~ age + sex + bmi + smoke, data=predimed, ref=1)
createTable(res1, show.ratio=TRUE)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
res2<-compareGroups(htn ~ age + sex + bmi + smoke, data=predimed, ref=c(smoke=1, sex=2))
createTable(res2, show.ratio=TRUE)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(htn ~ age + sex + bmi + hormo + hyperchol, data=predimed, ref.no='NO')
createTable(res, show.ratio=TRUE)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(htn ~ age + bmi, data=predimed)
createTable(res, show.ratio=TRUE)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(htn ~ age + bmi, data=predimed, fact.ratio= c(age=10, bmi=2))
createTable(res, show.ratio=TRUE)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(htn ~ age + sex + bmi + hyperchol, data=predimed)
createTable(res, show.ratio=TRUE)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(htn ~ age + sex + bmi + hyperchol, data=predimed, ref.y=2)
createTable(res, show.ratio=TRUE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
plot(compareGroups(tmain ~ sex, data=predimed), bivar=TRUE, file="./figures/bivarsurv/", type="png")
plot(compareGroups(tmain ~ age, data=predimed), bivar=TRUE, file="./figures/bivarsurv/", type="png")

## ---- echo=TRUE, results='hide'---------------------------------------------------------------------------------------------------------------------
res<-compareGroups(sex ~  age + tmain, timemax=c(tmain=3), data=predimed)
res

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
plot(res[2], file="./figures/univar/", type="png")
plot(res[2], bivar=TRUE, file="./figures/bivar/", type="png")

## ----echo=TRUE--------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(group ~ age + sex + smoke + waist + hormo, data=predimed, selec = list(hormo=sex=="Female"))
restab<-createTable(res)

## ---- echo=TRUE-------------------------------------------------------------------------------------------------------------------------------------
print(restab,which.table='descr')

## ---- echo=TRUE, eval=FALSE-------------------------------------------------------------------------------------------------------------------------
#  print(restab,which.table='avail')

## ---- echo=FALSE------------------------------------------------------------------------------------------------------------------------------------
print(restab,which.table='avail')

## ---------------------------------------------------------------------------------------------------------------------------------------------------
update(restab, hide = c(sex="Male"))

## ---------------------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(group ~ age + sex + htn + diab, data=predimed)
createTable(res, hide.no='no', hide = c(sex="Male"))

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(res, digits= c(age=2, sex = 3))

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(res, type=1)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(res, type=3)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(res, show.n=TRUE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(res, show.descr=FALSE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(res, show.all=TRUE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(res, show.p.overall=FALSE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(res, show.p.trend=TRUE)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------------------------------------
#  createTable(res, show.p.mul=TRUE)

## ---- echo=FALSE------------------------------------------------------------------------------------------------------------------------------------
createTable(res, show.p.mul=TRUE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(update(res, subset= group!="Control"), show.ratio=TRUE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(compareGroups(tmain ~  group + age + sex, data=predimed), show.ratio=TRUE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(compareGroups(tmain ~  group + age + sex, data=predimed), show.ratio=TRUE, digits.ratio= 3)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
tab<-createTable(compareGroups(tmain ~  group + age + sex, data=predimed), show.all = TRUE)
print(tab, header.labels = c("p.overall" = "p-value", "all" = "All"))

## ---------------------------------------------------------------------------------------------------------------------------------------------------
restab1 <- createTable(compareGroups(group ~ age + sex, data=predimed))
restab2 <- createTable(compareGroups(group ~ bmi + smoke, data=predimed))
rbind("Non-modifiable risk factors"=restab1, "Modifiable risk factors"=restab2)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
x <- rbind("Non-modifiable"=restab1,"Modifiable"=restab2)
rbind("Non-modifiable"=restab1,"Modifiable"=restab2)[c(1,4)]

## ---------------------------------------------------------------------------------------------------------------------------------------------------
rbind("Modifiable"=restab1,"Non-modifiable"=restab2)[c(4,3,2,1)]

## ---------------------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(group ~ age +  smoke + bmi + htn , data=predimed)
alltab <- createTable(res,  show.p.overall = FALSE)
femaletab <- createTable(update(res,subset=sex=='Female'), show.p.overall = FALSE)
maletab <- createTable(update(res,subset=sex=='Male'), show.p.overall = FALSE)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------------------------------------
#  cbind("ALL"=alltab,"FEMALE"=femaletab,"MALE"=maletab)

## ---- echo=FALSE------------------------------------------------------------------------------------------------------------------------------------
cbind("ALL"=alltab,"FEMALE"=femaletab,"MALE"=maletab)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------------------------------------
#  cbind(alltab,femaletab,maletab,caption=NULL)

## ---- echo=FALSE------------------------------------------------------------------------------------------------------------------------------------
cbind(alltab,femaletab,maletab,caption=NULL)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------------------------------------
#  cbind(alltab,femaletab,maletab)

## ---- echo=FALSE------------------------------------------------------------------------------------------------------------------------------------
cbind(alltab,femaletab,maletab)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
res <- compareGroups(group ~ . -sex, predimed)
restab <- createTable(res, hide.no="no")

## ---- eval=FALSE------------------------------------------------------------------------------------------------------------------------------------
#  strataTable(restab, "sex")

## ---- echo=FALSE------------------------------------------------------------------------------------------------------------------------------------
strataTable(restab, "sex")

## ---------------------------------------------------------------------------------------------------------------------------------------------------
print(createTable(compareGroups(group ~ age + sex + smoke + waist + hormo, data=predimed)), which.table='both')

## ---------------------------------------------------------------------------------------------------------------------------------------------------
print(createTable(compareGroups(group ~ age + sex + smoke + waist + hormo, data=predimed)),  nmax=FALSE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
summary(createTable(compareGroups(group ~ age + sex + smoke + waist + hormo, data=predimed)))

## ---------------------------------------------------------------------------------------------------------------------------------------------------
res<-compareGroups(group ~ age + sex + smoke + waist + hormo, data=predimed)
restab<-createTable(res, type=1, show.ratio=TRUE )
restab
update(restab, show.n=TRUE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
update(restab, x = update(res, subset=c(sex=='Female')), show.n=TRUE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(compareGroups(group ~ age + sex + smoke + waist + hormo, data=predimed))

## ---------------------------------------------------------------------------------------------------------------------------------------------------
createTable(compareGroups(group ~ age + sex + bmi, data=predimed))[1:2, ]

## ---------------------------------------------------------------------------------------------------------------------------------------------------
descrTable(predimed)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
descrTable(~ age + sex, predimed)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
descrTable(predimed, hide.no="no")

## ---------------------------------------------------------------------------------------------------------------------------------------------------
descrTable(group ~ ., predimed, hide.no="no", show.all=TRUE)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------------------------------------
#  descrTable(predimed, subset=age>65)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
restab<-createTable(compareGroups(group ~ age + sex + smoke + waist + hormo, data=predimed))
export2latex(restab)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
res <- compareGroups(group ~ ., predimed)
restab <- createTable(res, hide.no="no")

## ---------------------------------------------------------------------------------------------------------------------------------------------------
export2md(restab)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
export2md(restab, strip=TRUE, first.strip=TRUE)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
export2md(restab, size=6)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
export2md(restab, width="400px")

## ---------------------------------------------------------------------------------------------------------------------------------------------------
resMales <- compareGroups(group ~ . -sex, predimed, subset=sex=="Male", simplify=FALSE)
resFemales <- compareGroups(group ~ . -sex, predimed, subset=sex=="Female", simplify=FALSE)
restabMales <- createTable(resMales, hide.no="no")
restabFemales <- createTable(resFemales, hide.no="no")
restab <- cbind("Males"=restabMales, "Females"=restabFemales)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
export2md(restab, size=8)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------------------------------------
#  # to know more about report function
#  ?report
#  
#  # info about REGICOR data set
#  ?regicor

## ---------------------------------------------------------------------------------------------------------------------------------------------------
# from a compareGroups object
data(regicor)
res <- compareGroups(year ~ .-id, regicor)
missingTable(res)

## ---- eval=FALSE,results='hide'---------------------------------------------------------------------------------------------------------------------
#  # or from createTable objects
#  restab <- createTable(res, hide.no = 'no')
#  missingTable(restab)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
# first create time-to-cardiovascular event
regicor$tcv<-with(regicor,Surv(tocv,cv=='Yes'))
# create the table
res <- compareGroups(tcv ~ . -id-tocv-cv-todeath-death, regicor, include.miss = TRUE)
restab <- createTable(res, hide.no = 'no')
restab

## ---------------------------------------------------------------------------------------------------------------------------------------------------
data(SNPs)
head(SNPs)

## ---------------------------------------------------------------------------------------------------------------------------------------------------
res<-compareSNPs(casco ~ snp10001 + snp10002 + snp10003, data=SNPs)
res

## ---------------------------------------------------------------------------------------------------------------------------------------------------
res<-compareSNPs(~ snp10001 + snp10002 + snp10003, data=SNPs)
res

## ---- echo=FALSE, results='asis'--------------------------------------------------------------------------------------------------------------------
export2md(createTable(compareGroups(group ~  age + sex + smoke + bmi + waist + wth + htn + diab + hyperchol + famhist + hormo + p14 + toevent + event, data=predimed), hide.no="No",hide = c(sex="Male")))

## ---- echo=FALSE, results='asis'--------------------------------------------------------------------------------------------------------------------
export2md(createTable(compareGroups(htn ~  age + sex + smoke + bmi + waist + wth + diab + hyperchol + famhist + hormo + p14 + toevent + event, data=predimed), hide.no="No",hide = c(sex="Male"), show.ratio=TRUE, show.descr=FALSE))

## ---- echo=FALSE, results='asis'--------------------------------------------------------------------------------------------------------------------
export2md(createTable(compareGroups(tmain ~  group + age + sex, data=predimed), show.ratio=TRUE))

## ---- eval=FALSE------------------------------------------------------------------------------------------------------------------------------------
#  library(compareGroups)
#  cGroupsWUI()

