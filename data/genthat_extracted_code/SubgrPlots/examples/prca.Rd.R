library(SubgrPlots)


### Name: prca
### Title: Prostate Cancer Dataset
### Aliases: prca
### Keywords: datasets

### ** Examples

## Not run: 
##D # Code used to download the dataset and create variables
##D library(haven)
##D l1 <- "https://onlinelibrary.wiley.com/action/"
##D l2 <- "downloadSupplement?doi=10.1002%2Fbimj.201500147&attachmentId=2173117089"
##D data_url <- paste0(l1,l2)
##D temp <- tempfile()
##D download.file(data_url,temp)
##D prca0 <- read_sas(unz(temp, "adv_prostate_ca.sas7bdat"))
##D # Select the variables that we use for the analysis
##D prca <- prca0[,c("SURVTIME","CENS","RX","BM","HX","STAGE","PF", "AGE", "WT")]
##D 
##D # Change names of variables to lower case
##D names(prca)<- c("survtime","cens","rx","bm",
##D                 "hx","stage","pf","age", "wt")
##D 
##D # Create subgroups for Age and Weight and Stage
##D prca$age1 <- 1 * (prca$age > 65 & prca$age <= 75)
##D prca$age2 <- 1 * (prca$age > 75)
##D prca$wt1  <- 1 * (prca$wt > 90 & prca$wt <= 110)
##D prca$wt2  <- 1 * (prca$wt > 110)
##D 
##D # Create subgroups for Age and Weight and Stage with (-1,1) coding
##D prca$agegroup <- 1 + (1 * (prca$age > 65) + 1 * (prca$age > 75))
##D prca$wtgroup  <- 1 + (1 * (prca$wt > 90) + 1 * (prca$wt > 110))
##D dat = prca
##D dat$agegroup = factor(dat$agegroup)
##D dat$wtgroup = factor(dat$wtgroup)
##D range(dat$age)
##D range(dat$wt)
##D levels(dat$agegroup) = c("[48,65]","(65,75]","(75,89]")
##D levels(dat$wtgroup)  = c("[69,90]","(90,110]","(110,152]")
##D ## We need variables as factors
##D dat$bm    = factor(dat$bm)
##D dat$hx    = factor(dat$hx)
##D dat$stage = factor(dat$stage)
##D dat$pf    = factor(dat$pf)
##D dat$rx    = factor(dat$rx) # Treatment
##D 
##D # Put labels to the variables so that they appear in the plot
##D names(dat)<- c("survtime",
##D                "cens",
##D                "rx",
##D                "bm",
##D                "hx",
##D                "stage",
##D                "pf",
##D                "age",
##D                "weight",
##D                "age1",
##D                "age2",
##D                "wt1",
##D                "wt2",
##D                "age_group",
##D                "weight_group")
##D prca <- dat
##D ## devtools::use_data(prca, overwrite = T) ## Use it as dataset for the package
## End(Not run)



