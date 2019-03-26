library(memisc)


### Name: mtable
### Title: Comparative Table of Model Estimates
### Aliases: mtable relabel.memisc_mtable format.memisc_mtable
###   print.memisc_mtable write.mtable toLatex.memisc_mtable
###   dim.memisc_mtable dimnames.memisc_mtable [.memisc_mtable
###   c.memisc_mtable
### Keywords: misc

### ** Examples

#### Basic workflow

lm0 <- lm(sr ~ pop15 + pop75,              data = LifeCycleSavings)
lm1 <- lm(sr ~                 dpi + ddpi, data = LifeCycleSavings)
lm2 <- lm(sr ~ pop15 + pop75 + dpi + ddpi, data = LifeCycleSavings)

mtable123 <- mtable("Model 1"=lm0,"Model 2"=lm1,"Model 3"=lm2,
    summary.stats=c("sigma","R-squared","F","p","N"))

(mtable123 <- relabel(mtable123,
  "(Intercept)" = "Constant",
          pop15 = "Percentage of population under 15",
          pop75 = "Percentage of population over 75",
            dpi = "Real per-capita disposable income",
           ddpi = "Growth rate of real per-capita disp. income"
  ))

# This produces output in tab-delimited format:
write.mtable(mtable123)

## Not run: 
##D # This produces output in tab-delimited format:
##D file123 <- "mtable123.txt"
##D write.mtable(mtable123,file=file123)
##D file.show(file123)
##D # The contents of this file can be pasted into Word
##D # and converted into a Word table.
## End(Not run)
## Don't show: 
toLatex(mtable123)
## End(Don't show)
## Not run: 
##D texfile123 <- "mtable123.tex"
##D write.mtable(mtable123,format="LaTeX",file=texfile123)
##D file.show(texfile123)
## End(Not run)

#### Examples with UC Berkeley data

berkeley <- Aggregate(Table(Admit,Freq)~.,data=UCBAdmissions)

berk0 <- glm(cbind(Admitted,Rejected)~1,data=berkeley,family="binomial")
berk1 <- glm(cbind(Admitted,Rejected)~Gender,data=berkeley,family="binomial")
berk2 <- glm(cbind(Admitted,Rejected)~Gender+Dept,data=berkeley,family="binomial")

mtable(berk0,summary.stats=c("Deviance","N"))
mtable(berk1,summary.stats=c("Deviance","N"))

mtable(berk0,berk1,berk2,summary.stats=c("Deviance","N"))

mtable(berk0,berk1,berk2,
          coef.style="horizontal",
          summary.stats=c("Deviance","AIC","N"))
mtable(berk0,berk1,berk2,
          coef.style="stat",
          summary.stats=c("Deviance","AIC","N"))
mtable(berk0,berk1,berk2,
          coef.style="ci",
          summary.stats=c("Deviance","AIC","N"))
mtable(berk0,berk1,berk2,
          coef.style="ci.se",
          summary.stats=c("Deviance","AIC","N"))
mtable(berk0,berk1,berk2,
          coef.style="ci.se.horizontal",
          summary.stats=c("Deviance","AIC","N"))
mtable(berk0,berk1,berk2,
          coef.style="ci.p.horizontal",
          summary.stats=c("Deviance","AIC","N"))
mtable(berk0,berk1,berk2,
          coef.style="ci.horizontal",
          summary.stats=c("Deviance","AIC","N"))
mtable(berk0,berk1,berk2,
          coef.style="all",
          summary.stats=c("Deviance","AIC","N"))
mtable(berk0,berk1,berk2,
          coef.style="all.nostar",
          summary.stats=c("Deviance","AIC","N"))

mtable(by(berkeley,berkeley$Dept,
  function(x)glm(cbind(Admitted,Rejected)~Gender,
        data=x,family="binomial")),
      summary.stats=c("Likelihood-ratio","N"))


mtable(By(~Gender,
  glm(cbind(Admitted,Rejected)~Dept,
        family="binomial"),
        data=berkeley),
      summary.stats=c("Likelihood-ratio","N"))

berkfull <- glm(cbind(Admitted,Rejected)~Dept/Gender - 1,
                      data=berkeley,family="binomial")
relabel(mtable(berkfull),Dept="Department",gsub=TRUE)

#### Array-like semantics

mtable123 <- mtable("Model 1"=lm0,"Model 2"=lm1,"Model 3"=lm2,
    summary.stats=c("sigma","R-squared","F","p","N"))

dim(mtable123)
dimnames(mtable123)
mtable123[c("dpi","ddpi"),
          c("Model 2","Model 3")]

#### Concatention
mt01 <- mtable(lm0,lm1,summary.stats=c("R-squared","N"))
mt12 <- mtable(lm1,lm2,summary.stats=c("R-squared","F","N"))
c(mt01,mt12) # not that this makes sense, but ...
c("Group 1"=mt01,
  "Group 2"=mt12)



