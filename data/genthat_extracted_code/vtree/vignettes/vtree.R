## ---- echo=FALSE---------------------------------------------------------
library(vtree)

## ---- echo=FALSE---------------------------------------------------------
PNGdir <- tempdir()

## ---- echo=FALSE---------------------------------------------------------
v1 <- vtree(FakeData,"Severity Sex",showlegend=FALSE,horiz=FALSE,width=600,height=200)
filepath <- grVizToPNG(v1,folder=PNGdir,width=1000)

## ---- eval=FALSE---------------------------------------------------------
#  vtree(df,"v1 v2")

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity")

## ----echo=FALSE----------------------------------------------------------
v2 <- vtree(FakeData,"Severity",width=250,height=250)
filepath <- grVizToPNG(v2,folder=PNGdir,width=1000)

## ---- eval=FALSE---------------------------------------------------------
#  vtree(FakeData,"Severity Sex",horiz=FALSE,plain=TRUE)

## ---- echo=FALSE---------------------------------------------------------
v3 <- vtree(FakeData,"Severity Sex",horiz=FALSE,plain=TRUE,width=550,height=200)
filepath <- grVizToPNG(v3,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity Sex",showlegend=TRUE,shownodelabels=FALSE)

## ----echo=FALSE----------------------------------------------------------
v4 <- vtree(FakeData,"Severity Sex",showlegend=TRUE,shownodelabels=FALSE,width=550,height=450)
filepath <- grVizToPNG(v4,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity Sex Viral",sameline=TRUE)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity Sex",prune=list(Severity=c("Mild","Moderate")))

## ----echo=FALSE----------------------------------------------------------
v6 <- vtree(FakeData,"Severity Sex",prune=list(Severity=c("Mild","Moderate")),
  width=500,height=300)
filepath <- grVizToPNG(v6,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity Sex",prunebelow=list(Severity=c("Mild","Moderate")))

## ----echo=FALSE----------------------------------------------------------
v7 <- vtree(FakeData,"Severity Sex",prunebelow=list(Severity=c("Mild","Moderate")),
  width=500,height=300)
filepath <- grVizToPNG(v7,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity Sex",horiz=FALSE,
#    labelvar=c(Severity="Severity on day 1"),labelnode=list(Sex=c(Male="M",Female="F")))

## ----echo=FALSE----------------------------------------------------------
v8 <- vtree(FakeData,"Severity Sex",horiz=FALSE,width=700,height=250,
  labelvar=c(Severity="Severity on day 1"),
  labelnode=list(Sex=c(Male="M",Female="F")))
filepath <- grVizToPNG(v8,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity",horiz=FALSE,
#    text=list(Severity=c(Mild="*Includes first-time visits*")))

## ----echo=FALSE----------------------------------------------------------
v9 <- vtree(FakeData,"Severity",horiz=FALSE,
  text=list(Severity=c(Mild="*Includes first-time visits*")),
  width=450,height=150)
filepath <- grVizToPNG(v9,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity",summary="Score %mean%",horiz=FALSE)

## ----echo=FALSE----------------------------------------------------------
v10 <- vtree(FakeData,"Severity",summary="Score %mean%",horiz=FALSE,
  width=450,height=150)
filepath <- grVizToPNG(v10,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity",horiz=FALSE,showvarnames=FALSE,
#    summary=c(
#      "Score \nScore: mean (SD)\n %mean% (%SD%)",
#      "Pre \n\nPre: range\n %min%, %max%"))

## ----echo=FALSE----------------------------------------------------------
v11 <- vtree(FakeData,"Severity",horiz=FALSE,showvarnames=FALSE,
  summary=c(
    "Score \nScore: mean (SD)\n %mean% (%SD%)",
    "Pre \n\nPre: range\n %min%, %max%"),
  width=650,height=350)
filepath <- grVizToPNG(v11,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity",summary="Viral \nViral %npct%",horiz=FALSE,showvarnames=FALSE)

## ----echo=FALSE----------------------------------------------------------
v12 <- vtree(FakeData,"Severity",summary="Viral \nViral %npct%",horiz=FALSE,showvarnames=FALSE,
  width=650,height=200)
filepath <- grVizToPNG(v12,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity",summary="id \nid = %list% %node=Severity% %trunc=40%",
#    horiz=FALSE,showvarnames=FALSE)

## ----echo=FALSE----------------------------------------------------------
v13 <- vtree(FakeData,"Severity",summary="id \nid = %list% %node=Severity% %trunc=40%",
  horiz=FALSE,showvarnames=FALSE,width=650,height=200)
filepath <- grVizToPNG(v13,folder=PNGdir,width=1000)

## ---- comment=""---------------------------------------------------------
dotscript <- vtree(FakeData,"Severity",getscript=TRUE)
cat(dotscript)

## ---- eval=FALSE---------------------------------------------------------
#  vtree(FakeData,"Ind1 Ind2 Ind3 Ind4",Venn=TRUE)

## ---- echo=FALSE---------------------------------------------------------
v21 <- vtree(FakeData,"Ind1 Ind2 Ind3 Ind4",Venn=TRUE,width=650,height=650)
filepath <- grVizToPNG(v21,folder=PNGdir,width=1000)

## ---- eval=FALSE---------------------------------------------------------
#  vtree(FakeData,"Ind1 Ind2 Ind3 Ind4",Venn=TRUE)

## ---- echo=FALSE---------------------------------------------------------
v22 <- vtree(FakeData,"Ind1 Ind2 Ind3 Ind4",Venn=TRUE,showpct=TRUE,showlegend=TRUE,
  width=650,height=650)
filepath <- grVizToPNG(v22,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  sequence <- with(FakeData,paste(Ind1,Ind2,Ind3,Ind4))

## ----echo=FALSE----------------------------------------------------------
sequence <- with(FakeData,paste(Ind1,Ind2,Ind3,Ind4,sep="|"))

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Ind1 Ind2 Ind3 Ind4",Venn=TRUE,seq=TRUE,
#    palette=c(Ind1=1,Ind2=2,Ind3=3,Ind4=4))

## ----echo=FALSE----------------------------------------------------------
v23 <- vtree(FakeData,"Ind1 Ind2 Ind3 Ind4",Venn=TRUE,seq=TRUE,
  palette=c(Ind1=1,Ind2=2,Ind3=3,Ind4=4))
filepath <- grVizToPNG(v23,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity Age Pre Post",check.is.na=TRUE)

## ----echo=FALSE----------------------------------------------------------
v24 <- vtree(FakeData,"Severity Age Pre Post",check.is.na=TRUE,
  width=700,height=370)
filepath <- grVizToPNG(v24,folder=PNGdir,width=1000)

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeData,"Severity Age Pre Post",check.is.na=TRUE,seq=TRUE,
#    palette=c(Severity=1,Age=2,Pre=3,Post=4))

## ----echo=FALSE----------------------------------------------------------
v25 <- vtree(FakeData,"Severity Age Pre Post",check.is.na=TRUE,seq=TRUE,
  palette=c(Severity=1,Age=2,Pre=3,Post=4))
filepath <- grVizToPNG(v25,folder=PNGdir,width=1000)

## ------------------------------------------------------------------------
FakeRCT

## ----eval=FALSE----------------------------------------------------------
#  vtree(FakeRCT,"eligible randomized group followup analyzed",plain=TRUE,
#    keep=list(eligible="Eligible",randomized="Randomized",followup="Followed up"),
#    horiz=FALSE,showvarnames=FALSE,title="Assessed for eligibility")

## ----echo=FALSE----------------------------------------------------------
v26 <- vtree(FakeRCT,"eligible randomized group followup analyzed",plain=TRUE,width=230,height=500,
  keep=list(eligible="Eligible",randomized="Randomized",followup="Followed up"),
  horiz=FALSE,showvarnames=FALSE,title="Assessed for eligibility")
filepath <- grVizToPNG(v26,folder=PNGdir,width=1000)

## ---- eval=FALSE, echo=FALSE---------------------------------------------
#  IneligibleReasons <- paste0(
#    "Not meeting inclusion criteria (n=",sum(FakeRCT$eligible=="Ineligible")-sum(FakeRCT$declined),")\n",
#    "Declined to participate (n= ",sum(FakeRCT$declined),")\n")
#  
#  AllocatedA <- paste0(
#    "Did not receive allocated intervention (n=",
#    sum(!FakeRCT[FakeRCT$eligible=="Eligible" & FakeRCT$randomized=="Randomized" & FakeRCT$group=="A",]$received),")")
#  
#  LostB <- paste0(
#    "Lost to follow-up (n=",
#    sum(FakeRCT[FakeRCT$eligible=="Eligible" & FakeRCT$randomized=="Randomized" & FakeRCT$group=="B",]$lost),")")
#  
#  #   text=list(eligible=c("Ineligible"=IneligibleReasons),group=c("A"=AllocatedA),followup=c("Followed up"=LostB)),

## ----eval=FALSE----------------------------------------------------------
#  v7 <- vtree(FakeRCT,"eligible randomized group followup analyzed",plain=TRUE,
#    follow=list(eligible="Eligible",randomized="Randomized",followup="Followed up"),
#    horiz=FALSE,showvarnames=FALSE,title="Assessed for eligibility")

## ---- echo=FALSE---------------------------------------------------------
v27 <- vtree(FakeRCT,"eligible randomized group followup analyzed",plain=TRUE,width=400,height=500,
  follow=list(eligible="Eligible",randomized="Randomized",followup="Followed up"),
  horiz=FALSE,showvarnames=FALSE,title="Assessed for eligibility")
filepath <- grVizToPNG(v27,folder=PNGdir,width=1000)

## ---- eval=FALSE---------------------------------------------------------
#  vtree(FakeRCT,"eligible randomized group followup analyzed",plain=TRUE,
#    follow=list(eligible="Eligible",randomized="Randomized",followup="Followed up"),
#    horiz=FALSE,showvarnames=FALSE,title="Assessed for eligibility",
#    summary="id \nid: %list% %noroot%")

## ---- echo=FALSE---------------------------------------------------------
v28 <- vtree(FakeRCT,"eligible randomized group followup analyzed",plain=TRUE,width=500,height=600,
  follow=list(eligible="Eligible",randomized="Randomized",followup="Followed up"),
  horiz=FALSE,showvarnames=FALSE,title="Assessed for eligibility",
  summary="id \nid: %list% %noroot%")
filepath <- grVizToPNG(v28,folder=PNGdir,width=1000)

## ---- eval=FALSE---------------------------------------------------------
#  example1 <- vtree(FakeData,"Severity Sex")

## ---- eval=FALSE---------------------------------------------------------
#  grVizToPNG(example1)

## ---- highlight=FALSE, eval=FALSE----------------------------------------
#  ![](example1.png){ height=3in }

## ---- highlight=FALSE, eval=FALSE----------------------------------------
#  ![](MyFolder/example1.png){ height=3in }

