library(psychReport)


### Name: aovSphericityAdjustment
### Title: aovSphericityAdjustment
### Aliases: aovSphericityAdjustment

### ** Examples

requiredPackages(c("dplyr", "ez"))
# Example 1:
# create dataframe with 3(Comp: neutral vs. comp vs. incomp) factors/levels
dat <- createDF(nVP = 20,
                nTrl = 50,
                design = list("Comp" = c("neutral", "comp", "incomp")))

dat <- addDataDF(dat,
                 RT = list(list(c("Comp:neutral"), vals = c(510, 150, 100)),
                           list(c("Comp:comp"), vals = c(500, 150, 100)),
                           list(c("Comp:incomp"), vals = c(520, 150, 100))))

# aggregate dat across trials
datAggVP <- dat %>%
    group_by(VP, Comp) %>%
    summarize(N = n(),
              rt = mean(RT))

# repeated measures ANOVA using ezANOVA
aovRT <- ezANOVA(datAggVP, dv=.(rt), wid = .(VP), within = .(Comp),
                 return_aov = TRUE, detailed = TRUE)
aovDispTable(aovRT)
aovRT <- aovSphericityAdjustment(aovRT)
aovDispTable(aovRT)




