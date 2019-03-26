library(table1)


### Name: eqcut
### Title: Cut a continuous variable into equal-sized groups.
### Aliases: eqcut eqcut.default.labeling
### Keywords: utilities

### ** Examples

x <- sample(100)
table(eqcut(x, 2))
table(eqcut(x, 3))
table(eqcut(x, 4))
table(eqcut(x, 5))
table(eqcut(x, 6))
table(eqcut(x, 7))
table(eqcut(x, 8))

# An example of using eqcut in a table with custom labeling function.
dat <- expand.grid(id=1:100, sex=c("Male", "Female"), treat=c("Treated", "Placebo"))
dat$age <- runif(nrow(dat), 18, 50)
dat$wt <- exp(rnorm(nrow(dat), log(75 + 10*(dat$sex=="Male")), 0.2))
dat$auc <- ifelse(dat$treat=="Placebo", NA, exp(rnorm(nrow(dat), log(1000), 0.34)))
dat$auc[3] <- NA  # Add a missing value

label(dat$sex) <- "Sex"
label(dat$age) <- "Age"
label(dat$wt)  <- "Weight"
label(dat$auc) <- "AUC"
units(dat$age) <- "y"
units(dat$wt)  <- "kg"
units(dat$auc) <- "ng.h/mL"

w <- list(Placebo=(dat$treat=="Placebo"), Excluded=is.na(dat$auc))
f <- function(x, xcat, which, what, from, to, ...) {
   what <- sub("of ", "of<br/>", what)
   sprintf("%s %s<br/>&ge;%s to &lt;%s",
       which, what, signif_pad(from, 3, FALSE), signif_pad(to, 3, FALSE))
}
table1(~ sex + age + wt | eqcut(auc, 3, f, w), data=dat)




