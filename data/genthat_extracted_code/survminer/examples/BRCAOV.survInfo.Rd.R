library(survminer)


### Name: BRCAOV.survInfo
### Title: Breast and Ovarian Cancers Survival Information
### Aliases: BRCAOV.survInfo

### ** Examples

data(BRCAOV.survInfo)
library(survival)
fit <- survfit(Surv(times, patient.vital_status) ~ admin.disease_code,
           data = BRCAOV.survInfo)
ggsurvplot(fit, data = BRCAOV.survInfo, risk.table = TRUE)



