library(HSAUR2)


### Name: CHFLS
### Title: Chinese Health and Family Life Survey
### Aliases: CHFLS
### Keywords: datasets

### ** Examples


## Not run: 
##D 
##D     ### for a description see http://popcenter.uchicago.edu/data/chfls.shtml
##D     library("TH.data")
##D     load(file.path(path.package(package="TH.data"), "rda", "CHFLS.rda"))
##D 
##D     tmp <- chfls1[, c("REGION6", "ZJ05", "ZJ06", "A35", "ZJ07", "ZJ16M", "INCRM",
##D                       "JK01", "JK02", "JK20", "HY04", "HY07", "A02", "AGEGAPM", 
##D                       "A07M", "A14", "A21", "A22M", "A23", "AX16", "INCAM", "SEXNOW", "ZW04")]
##D 
##D      names(tmp) <- c("Region",
##D                 "Rgender",               ### gender of respondent
##D                 "Rage",                  ### age of respondent
##D 		"RagestartA",		 ### age of respondent at beginning of relationship 
##D                                          ### with partner A
##D                 "Redu",                  ### education of respondent
##D                 "RincomeM",              ### rounded monthly income of respondent
##D 		"RincomeComp",		 ### inputed monthly income of respondent
##D                 "Rhealth",               ### health condition respondent
##D                 "Rheight",               ### respondent's height
##D                 "Rhappy",                ### respondent's happiness
##D                 "Rmartial",              ### respondent's marital status
##D                 "RhasA",                 ### R has current A partner
##D                 "Agender",               ### gender of partner A
##D                 "RAagegap",              ### age gap
##D                 "RAstartage",            ### age at marriage
##D                 "Aheight",               ### height of partner A
##D                 "Aedu",                  ### education of partner A
##D                 "AincomeM",              ### rounded partner A income
##D                 "AincomeEst",            ### estimated partner A income
##D                 "orgasm",                ### orgasm frequency
##D                 "AincomeComp",           ### imputed partner A income
##D                 "Rsexnow",               ### has sex last year
##D                 "Rhomosexual")           ### R is homosexual
##D 
##D     ### code missing values
##D     tmp$AincomeM[tmp$AincomeM < 0] <- NA
##D     tmp$RincomeM[tmp$RincomeM < 0] <- NA
##D     tmp$Aheight[tmp$Aheight < 0] <- NA
##D 
##D     olevels <- c("never", "rarely", "sometimes", "often", "always")
##D     tmpA <- subset(tmp, Rgender == "female" & Rhomosexual != "yes" & orgasm %in% olevels)
##D 
##D     ### 1534 subjects
##D     dim(tmpA)
##D 
##D     CHFLS <- tmpA[, c("Region", "Rage", "Redu", "RincomeComp", "Rhealth", "Rheight", "Rhappy",
##D                       "Aheight", "Aedu", "AincomeComp")]
##D     names(CHFLS) <- c("R_region", "R_age", "R_edu", "R_income", "R_health", "R_height", 
##D                       "R_happy", "A_height", "A_edu", "A_income")
##D     levels(CHFLS$R_region) <- c("Coastal South", "Coastal Easth", "Inlands", "North", 
##D                                 "Northeast", "Central West")
##D 
##D     CHFLS$R_edu <- ordered(as.character(CHFLS$R_edu), levels = c("no school", "primary", 
##D                            "low mid", "up mid", "j col", "univ/grad"))
##D     levels(CHFLS$R_edu) <- c("Never attended school", "Elementary school", "Junior high school", 
##D                              "Senior high school", "Junior college", "University")
##D     CHFLS$A_edu <- ordered(as.character(CHFLS$A_edu), levels = c("no school", "primary", 
##D                            "low mid", "up mid", "j col", "univ/grad"))
##D     levels(CHFLS$A_edu) <- c("Never attended school", "Elementary school", "Junior high school", 
##D                              "Senior high school", "Junior college", "University")
##D 
##D     CHFLS$R_health <- ordered(as.character(CHFLS$R_health), levels = c("poor", "not good", 
##D                               "fair", "good", "excellent"))
##D     levels(CHFLS$R_health) <- c("Poor", "Not good", "Fair", "Good", "Excellent")
##D 
##D     CHFLS$R_happy <- ordered(as.character(CHFLS$R_happy), levels = c("v unhappy", "not too", 
##D                              "relatively", "very"))
##D     levels(CHFLS$R_happy) <- c("Very unhappy", "Not too happy", "Relatively happy", "Very happy")
## End(Not run)




