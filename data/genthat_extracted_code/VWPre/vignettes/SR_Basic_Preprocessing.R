## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=4, warning=FALSE)

## ---- echo=FALSE, eval=TRUE, message=FALSE-------------------------------
library(VWPre)
data(VWdat)

## ---- eval= FALSE, echo=TRUE, results='asis'-----------------------------
#  library(VWPre)
#  VWdat <- read.table("1000HzData.txt", header = T, sep = "\t", na.strings = c(".", "NA"))

## ---- eval= FALSE, echo=TRUE, results='asis'-----------------------------
#  data(VWdat)

## ---- eval=TRUE, echo=TRUE, results='asis'-------------------------------
dat0 <- prep_data(data = VWdat, Subject = "RECORDING_SESSION_LABEL", Item = "itemid")

## ---- eval= FALSE, echo=TRUE, results='asis'-----------------------------
#  dat0 <- rm_extra_DVcols(dat0, Keep = c("RIGHT_PUPIL_SIZE", "LEFT_PUPIL_SIZE"))

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
dat1 <- relabel_na(data = dat0, NoIA = 4)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_ia(data = dat1)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
dat2 <- create_time_series(data = dat1, Adjust = 100)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_time_series(data = dat2)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_msg_time(data = dat2, Msg = "TargetOnset")

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_eye_recording(data = dat2)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
dat3 <- select_recorded_eye(data = dat2, Recording = "R", WhenLandR = "Right")

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_samplingrate(dat3)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
ds_options(SamplingRate = 1000)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
dat4 <- bin_prop(dat3, NoIA = 4, BinSize = 20, SamplingRate = 1000)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_samplingrate(dat4)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
check_samples_per_bin(dat4)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
dat5 <- transform_to_elogit(dat4, NoIA = 4, ObsPerBin = 20)

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
dat5a <- create_binomial(data = dat4, NoIA = 4, ObsPerBin = 20)

## ---- eval = TRUE, echo=TRUE, results='asis'-----------------------------
dat5b <- fasttrack(data = VWdat, Subject = "RECORDING_SESSION_LABEL", Item = "itemid", 
	EventColumns = c("Subject", "TRIAL_INDEX"), NoIA = 4, Adjust = 100, Recording = "LandR", 
  WhenLandR = "Right", BinSize = 20, SamplingRate = 1000,
  ObsPerBin = 20, Constant = 0.5, Output = "ELogit")

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
dat6 <- rename_columns(dat5, Labels = c(IA1="Target", IA2="Rhyme", 
                                       IA3="OnsetComp", IA4="Distractor")) 

## ---- eval= TRUE, echo=TRUE, results='asis'------------------------------
colnames(dat6) 

## ---- eval=FALSE, echo=TRUE, results='asis'------------------------------
#  FinalDat <- dat5 %>%
#    # Select just the columns you want
#    select(., Subject, Item, Time, starts_with("IA"), Event, TRIAL_INDEX, Rating,
#           InteractChinese, Exp, target, rhymecomp, onsetcomp, distractor) %>%
#    # Order the data by Subject, Trial, and Time
#    arrange(., Subject, TRIAL_INDEX, Time)

## ---- eval=FALSE, echo=TRUE, results='asis'------------------------------
#  save(FinalDat, file = "FinalDat.rda", compress = "xz")

