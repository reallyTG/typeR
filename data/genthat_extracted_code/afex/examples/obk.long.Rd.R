library(afex)


### Name: obk.long
### Title: O'Brien Kaiser's Repeated-Measures Dataset with Covariate
### Aliases: obk.long
### Keywords: dataset

### ** Examples

# The dataset is constructed as follows:
data("OBrienKaiser", package = "carData")
set.seed(1)
OBrienKaiser2 <- within(OBrienKaiser, {
		id <- factor(1:nrow(OBrienKaiser))
		age <- scale(sample(18:35, nrow(OBrienKaiser), replace = TRUE), scale = FALSE)})
attributes(OBrienKaiser2$age) <- NULL # needed or resahpe2::melt throws an error.
OBrienKaiser2$age <- as.numeric(OBrienKaiser2$age)
obk.long <- reshape2::melt(OBrienKaiser2, id.vars = c("id", "treatment", "gender", "age"))
obk.long[,c("phase", "hour")] <- lapply(as.data.frame(do.call(rbind,
        strsplit(as.character(obk.long$variable), "\\."),)), factor)
obk.long <- obk.long[,c("id", "treatment", "gender", "age", "phase", "hour", "value")]
obk.long <- obk.long[order(obk.long$id),]
rownames(obk.long) <- NULL
str(obk.long)
## 'data.frame':   240 obs. of  7 variables:
##  $ id       : Factor w/ 16 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ treatment: Factor w/ 3 levels "control","A",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ gender   : Factor w/ 2 levels "F","M": 2 2 2 2 2 2 2 2 2 2 ...
##  $ age      : num  -4.75 -4.75 -4.75 -4.75 -4.75 -4.75 -4.75 -4.75 -4.75 -4.75 ...
##  $ phase    : Factor w/ 3 levels "fup","post","pre": 3 3 3 3 3 2 2 2 2 2 ...
##  $ hour     : Factor w/ 5 levels "1","2","3","4",..: 1 2 3 4 5 1 2 3 4 5 ...
##  $ value    : num  1 2 4 2 1 3 2 5 3 2 ...
head(obk.long)
##    id treatment gender   age phase hour value
## 1  1   control      M -4.75   pre    1     1
## 2  1   control      M -4.75   pre    2     2
## 3  1   control      M -4.75   pre    3     4
## 4  1   control      M -4.75   pre    4     2
## 5  1   control      M -4.75   pre    5     1
## 6  1   control      M -4.75  post    1     3



