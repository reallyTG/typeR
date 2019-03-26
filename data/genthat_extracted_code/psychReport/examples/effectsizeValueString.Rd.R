library(psychReport)


### Name: effectsizeValueString
### Title: effectsizeValueString
### Aliases: effectsizeValueString

### ** Examples

requiredPackages(c("dplyr", "ez"))
# Example 1:
# create dataframe and add data with 2(Comp: comp vs. incomp) and 2(Side: left vs. right)
dat <- createDF(nVP = 20,
                nTrl = 50,
                design = list("Comp" = c("comp", "incomp"),
                              "Side" = c("left", "right")))

dat <- addDataDF(dat, RT = list(list(c("Comp:comp", "Side:left"), vals = c(500, 150, 100)),
                                list(c("Comp:comp", "Side:right"), vals = c(500, 150, 100)),
                                list(c("Comp:incomp", "Side:left"), vals = c(520, 150, 100)),
                                list(c("Comp:incomp", "Side:right"), vals = c(520, 150, 100))))

# aggregate dat across trials
datAggVP <- dat %>%
    group_by(VP, Comp, Side) %>%
    summarize(N  = n(),
              rt = mean(RT))

# repeated measures ANOVA using ezANOVA
aovRT <- ezANOVA(datAggVP, dv=.(rt), wid = .(VP), within = .(Comp, Side),
                 return_aov = TRUE, detailed = TRUE)
aovRT <- aovTable(aovRT)

pesString <- effectsizeValueString(aovRT, "Comp")  # partial eta squared
pesString <- effectsizeValueString(aovRT, "Comp:Side")

## Not run: 
##D # Example use in *.Rnw Sweave file
##D # \Sexpr{pesString}
## End(Not run)




