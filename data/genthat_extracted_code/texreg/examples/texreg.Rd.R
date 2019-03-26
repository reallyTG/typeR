library(texreg)


### Name: texreg
### Title: Convert regression output to LaTeX or HTML tables
### Aliases: texreg htmlreg screenreg
### Keywords: print misc utilities IO programming|interface

### ** Examples

#Linear mixed-effects models
library(nlme)
model.1 <- lme(distance ~ age, data = Orthodont, random = ~ 1)
model.2 <- lme(distance ~ age + Sex, data = Orthodont, random = ~ 1)
texreg(list(model.1, model.2), booktabs = TRUE, dcolumn = TRUE)

#Ordinary least squares model (example from the 'lm' help file)
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2,10,20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
table.string <- texreg(lm.D9, return.string = TRUE)
cat(table.string)

#Create a 'fake' Office document containing a regression table
htmlreg(list(model.1, model.2), file = "texreg.doc", 
    inline.css = FALSE, doctype = TRUE, html.tag = TRUE, 
    head.tag = TRUE, body.tag = TRUE)
unlink("texreg.doc")



