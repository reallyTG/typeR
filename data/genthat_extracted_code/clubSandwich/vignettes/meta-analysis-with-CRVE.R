## ---- include=FALSE-------------------------------------------------------------------------------
options(width = 100)

## ---- message = FALSE-----------------------------------------------------------------------------
library(clubSandwich)
library(robumeta)
data(dropoutPrevention)

# clean formatting
names(dropoutPrevention)[7:8] <- c("eval","implement")
levels(dropoutPrevention$eval) <- c("independent","indirect","planning","delivery")
levels(dropoutPrevention$implement) <- c("low","medium","high")
levels(dropoutPrevention$program_site) <- c("community","mixed","classroom","school")
levels(dropoutPrevention$study_design) <- c("matched","unmatched","RCT")
levels(dropoutPrevention$adjusted) <- c("no","yes")

m3_robu <- robu(LOR1 ~ study_design + attrition + group_equivalence + adjusted
                + outcome + eval + male_pct + white_pct + average_age
                + implement + program_site + duration + service_hrs, 
                data = dropoutPrevention, studynum = studyID, var.eff.size = varLOR, 
                modelweights = "HIER")
print(m3_robu)

## -------------------------------------------------------------------------------------------------
Wald_test(m3_robu, constraints = 10:12, vcov = "CR2")

## -------------------------------------------------------------------------------------------------
table(dropoutPrevention$eval)

## ---- message = FALSE-----------------------------------------------------------------------------
library(metafor)
m3_metafor <- rma.mv(LOR1 ~ study_design + attrition + group_equivalence + adjusted
                      + outcome + eval
                      + male_pct + white_pct + average_age
                      + implement + program_site + duration + service_hrs, 
                      V = varLOR, random = list(~ 1 | studyID, ~ 1 | studySample),
                     data = dropoutPrevention)
summary(m3_metafor)

## -------------------------------------------------------------------------------------------------
coef_test(m3_metafor, vcov = "CR2")

## -------------------------------------------------------------------------------------------------
Wald_test(m3_metafor, constraints = 10:12, vcov = "CR2")

