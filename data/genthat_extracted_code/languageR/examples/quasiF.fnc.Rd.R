library(languageR)


### Name: quasiF.fnc
### Title: Quasi-F test
### Aliases: quasiF.fnc
### Keywords: regression

### ** Examples

  data(quasif)

  quasif.lm = lm(RT ~ SOA + Item + Subject + 
     SOA:Subject + Item:Subject, data = quasif)
  quasif.aov = anova(quasif.lm)

  quasiF.fnc(quasif.aov["SOA","Mean Sq"], 
     quasif.aov["Item:Subject", "Mean Sq"],
     quasif.aov["SOA:Subject", "Mean Sq"], 
     quasif.aov["Item", "Mean Sq"],
     quasif.aov["SOA","Df"], 
     quasif.aov["Item:Subject", "Df"],
     quasif.aov["SOA:Subject", "Df"], 
     quasif.aov["Item", "Df"])

  # much simpler is
  quasiFsim.fnc(quasif)$quasiF




