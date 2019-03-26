library(psychReport)


### Name: aovEffectSize
### Title: aovEffectSize
### Aliases: aovEffectSize

### ** Examples

library(psychReport)
requiredPackages(c("ez", "dplyr"))
# Example 1:
# create dataframe with 2(Comp: comp vs. incomp) and 2(Side: left vs. right) factors/levels
dat <- createDF(nVP = 20,
                nTrl = 50,
                design = list("Comp" = c("comp", "incomp"),
                              "Side" = c("left", "right")))

dat <- addDataDF(dat,
                 RT = list(list(c("Comp:comp", "Side:left"), vals = c(500, 150, 150)),
                           list(c("Comp:comp", "Side:right"), vals = c(500, 150, 150)),
                           list(c("Comp:incomp", "Side:left"), vals = c(500, 150, 150)),
                           list(c("Comp:incomp", "Side:right"), vals = c(500, 150, 150))))

# aggregate dat across trials
datAggVP <- dat %>%
    group_by(VP, Comp, Side) %>%
    summarize(N  = n(),
              rt = mean(RT))

# repeated measures ANOVA using ezANOVA
aovRT <- ezANOVA(datAggVP, dv=.(rt), wid = .(VP), within = .(Comp, Side),
                 return_aov = TRUE, detailed = TRUE)
aovRT <- aovEffectSize(aovRT, "ges")
aovRT <- aovEffectSize(aovRT, "pes")
aovRT <- aovEffectSize(aovRT, "es")
aovDispTable(aovRT)




