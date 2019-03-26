## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=4, warning=FALSE)

## ---- echo=FALSE, eval=TRUE, message=FALSE-------------------------------
library(VWPre)
data(VWdat)
dat0 <- prep_data(data = VWdat, Subject = "RECORDING_SESSION_LABEL", Item = "itemid")
dat1 <- relabel_na(data = dat0, NoIA = 4)
checkdat <- recode_ia(data=dat1, IDs=c("0"="0", "1"="11", "2"="234", "3"="399",
                                         "4"="444"), 
                        Labels=c(Outside="Outside", Target="Object1", 
                                 RhymeComp="Object2", OnsetComp="Object3",
                                 Distractor="Object4"))

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_ia(data = checkdat)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
newdat <- recode_ia(data=checkdat, IDs=c("0"="0", "11"="1", "234"="2", "399"="3",
                                         "444"="4"), 
                        Labels=c(Outside="Outside", Object1="Target", 
                                 Object2="RhymeCompetitor", Object3="OnsetCompetitor",
                                 Object4="Distractor"))

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_ia(data = newdat)

## ---- eval= FALSE, echo=TRUE, results='asis'-----------------------------
#  library(VWPre)
#  IAdat <- read.table("IAreport.txt", header = T, sep = "\t", na.strings = c(".", "NA"))

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
library(VWPre)
#data(IAdat)
load("IAdat.rda")

## ---- eval= TRUE, echo=FALSE, results='asis'-----------------------------
knitr::kable(head(IAdat[, c("RECORDING_SESSION_LABEL", "TRIAL_INDEX", "IA_LABEL")], 12))

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
IAdat$Event <- interaction(IAdat$RECORDING_SESSION_LABEL, IAdat$TRIAL_INDEX, drop = T)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
dat1 <- IAdat %>% mutate(ScreenLoc = ifelse(IA_LABEL=="Target", target_reg,
                        ifelse(IA_LABEL=="RhymeComp", rhymecomp_reg,
                               ifelse(IA_LABEL=="OnsetComp", onsetcomp_reg,
                                      ifelse(IA_LABEL=="Distractor", distractor_reg, NA))))
                  )

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
Loc_Table <- df1 <- data_frame(ScreenLoc = c(1, 2, 3, 4), 
                               Top = c(40, 40, 740, 740),
                               Bottom = c(340, 340, 1040, 1040),
                               Left = c(1160, 460, 460, 1160),
                               Right = c(1460, 760, 760, 1460))

## ---- eval= TRUE, echo=FALSE, results='asis'-----------------------------
knitr::kable(head(Loc_Table))

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
dat2 <- inner_join(dat1, Loc_Table, by="ScreenLoc")

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
dat2$IA_ID <- case_when(
  dat2$IA_LABEL == "Target" ~ 1,
  dat2$IA_LABEL == "RhymeComp" ~ 2,
  dat2$IA_LABEL == "OnsetComp" ~ 3,
  dat2$IA_LABEL == "Distractor" ~ 4
)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
LookUpTable <- dat2 %>% select(Event, IA_LABEL, IA_ID, Top, Bottom, Left, Right)

## ---- eval= TRUE, echo=FALSE, results='asis'-----------------------------
knitr::kable(head(LookUpTable, 12))

## ---- eval=TRUE, echo=FALSE, results='asis'------------------------------
sampledata <- dat0

## ---- eval=FALSE, echo=TRUE, results='asis'------------------------------
#  remapped <- custom_ia(data = sampledata, iaLookup = LookUpTable)

