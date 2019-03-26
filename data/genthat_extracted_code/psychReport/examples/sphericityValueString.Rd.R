library(psychReport)


### Name: sphericityValueString
### Title: sphericityValueString
### Aliases: sphericityValueString

### ** Examples

requiredPackages(c("dplyr", "ez"))
# Example 1
# create dataframe and add data with 3(Comp: neutral vs. comp vs. incomp) levels
dat <- createDF(nVP = 20,
                nTrl = 50,
                design = list("Comp" = c("neutral", "comp", "incomp")))

dat <- addDataDF(dat, RT = list(list(c("Comp:neutral"), vals = c(510, 150, 100)),
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
# adjustAovTableSphericity called by default within adjusutAovTableOptions
aovRT <- aovTable(aovRT)

sphericityValue <- sphericityValueString(aovRT, "Comp")

## Not run: 
##D # Example use in *.Rnw Sweave file
##D # \Sexpr{sphericityValue} 
## End(Not run)




