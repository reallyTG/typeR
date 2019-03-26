library(DescTools)


### Name: BreslowDayTest
### Title: Breslow-Day Test for Homogeneity of the Odds Ratios
### Aliases: BreslowDayTest
### Keywords: htest

### ** Examples

migraine <- xtabs(freq ~ .,
            cbind(expand.grid(treatment=c("active", "placebo"),
                              response =c("better", "same"),
                              gender   =c("female", "male")),
                  freq=c(16, 5, 11, 20, 12, 7, 16, 19))
            )

# get rid of gender
tab <- xtabs(Freq ~ treatment + response, migraine)
Desc(tab)

# only the women
female <- migraine[,, 1]
Desc(female)

# .. and the men
male <- migraine[,, 2]
Desc(male)

BreslowDayTest(migraine)
BreslowDayTest(migraine, correct = TRUE)


salary <- array(
      c(38, 12, 102, 141, 12, 9, 136, 383),
      dim=c(2, 2, 2),
      dimnames=list(exposure=c("exposed", "not"),
                    disease =c("case", "control"),
                    salary  =c("<1000", ">=1000"))
                    )

# common odds ratio = 4.028269
BreslowDayTest(salary, OR = 4.02)



