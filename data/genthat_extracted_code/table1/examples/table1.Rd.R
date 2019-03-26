library(table1)


### Name: table1
### Title: Generate an HTML table of descriptive statistics.
### Aliases: table1 table1.default table1.formula
### Keywords: utilities

### ** Examples


dat <- expand.grid(id=1:10, sex=c("Male", "Female"), treat=c("Treated", "Placebo"))
dat$age <- runif(nrow(dat), 10, 50)
dat$age[3] <- NA  # Add a missing value
dat$wt <- exp(rnorm(nrow(dat), log(70), 0.2))

label(dat$sex) <- "Sex"
label(dat$age) <- "Age"
label(dat$treat) <- "Treatment Group"
label(dat$wt) <- "Weight"

units(dat$age) <- "years"
units(dat$wt) <- "kg"

# One level of stratification
table1(~ sex + age + wt | treat, data=dat)

# Two levels of stratification (nesting)
table1(~ age + wt | treat*sex, data=dat)

# Switch the order or nesting
table1(~ age + wt | sex*treat, data=dat)

# No stratification
table1(~ treat + sex + age + wt, data=dat)

# Something more complicated

dat$dose <- ifelse(dat$treat=="Placebo", "Placebo",
                   sample(c("5 mg", "10 mg"), nrow(dat), replace=TRUE))
dat$dose <- factor(dat$dose, levels=c("Placebo", "5 mg", "10 mg"))

strata <- c(split(dat, dat$dose),
            list("All treated"=subset(dat, treat=="Treated")),
            list(Overall=dat))

labels <- list(
    variables=list(sex=render.varlabel(dat$sex),
                   age=render.varlabel(dat$age),
                   wt=render.varlabel(dat$wt)),
    groups=list("", "Treated", ""))

my.render.cont <- function(x) {
    with(stats.default(x), 
        sprintf("%0.2f (%0.1f)", MEAN, SD))
}

table1(strata, labels, groupspan=c(1, 3, 1), render.continuous=my.render.cont)

# Transposed table
table1(~ age + wt | treat, data=dat, transpose=TRUE)




