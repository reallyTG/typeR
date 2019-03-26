library(VetResearchLMM)


### Name: Examp1.3.2
### Title: #' @title Examp1.3.2 from Duchateau, L. and Janssen, P. and
###   Rowlands, G. J. (1998)._Linear Mixed Models. An Introduction with
###   applications in Veterinary Research_. International Livestock
###   Research Institute.
### Aliases: Examp1.3.2
### Keywords: datasets

### ** Examples

#-------------------------------------------------------------
## Example 1.3.2 p-16
#-------------------------------------------------------------
 # PROC GLM DATA=ex124;
 # CLASS herd dose drug;
 # MODEL PCVdif=drug herd(drug) dose dose*drug;
 # RANDOM herd(drug);
 # RUN;

library(lme4)
str(ex124)
summary(ex124)

ex124$herd1 <- factor(ex124$herd)
ex124$drug1 <- factor(ex124$drug)
ex124$dose1 <- factor(ex124$dose)

fm1.1 <-
  aov(
      formula     = PCVdif ~ drug1 + Error(herd1:drug1) + dose1 + dose1:drug1
    , data        = ex124
    , projections = FALSE
    , qr          = TRUE
    , contrasts   = NULL
  #  , ...
    )
summary(fm1.1)



