library(QCGWAS)


### Name: convert_impstatus
### Title: Convert imputation-status values to the QCGWAS standard
### Aliases: convert_impstatus
### Keywords: classes

### ** Examples

  status1 <- c(0,0,0,1,1,1,2,NA)
  status2 <- c(TRUE, FALSE, TRUE, FALSE, NA)
  status3 <- c("imputed", "genotyped", "NA", NA)
  status4 <- c(status1, status2, status3)
  
  ( outcome1 <- convert_impstatus(status1,
                                  T_strings = 1,
                                  F_strings = 0,
                                  NA_strings = NA) )
  # status 1 contains an untranslated value "2", which is
  # converted to NA. To avoid the warning message:
  
  ( outcome1 <- convert_impstatus(status1,
                                  T_strings = 1,
                                  F_strings = 0,
                                  NA_strings = c(NA, 2)) )
  
  
  ( outcome2 <- convert_impstatus(status2,
                                  T_strings = TRUE,
                                  F_strings = FALSE,
                                  NA_strings = NA) )
  
  ( outcome3 <- convert_impstatus(status3,
                                  T_strings = "imputed",
                                  F_strings = "genotyped",
                                  NA_strings = c("NA", NA)) )
  # Note that NA_strings includes both the character-string "NA"
  # and the value NA. Otherwise, one of the two would go 
  # "untranslated" and trigger a warning message.
  
  
  # And to check them all together
  ( outcome4 <- convert_impstatus(status4,
                          T_strings = c(1, TRUE, "imputed"),
                          F_strings = c(0, FALSE, "genotyped"),
                          NA_strings = c("NA", NA, 2)) )



