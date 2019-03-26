library(psychReport)


### Name: printTable
### Title: printTable
### Aliases: printTable

### ** Examples

requiredPackages(c("dplyr", "ez"))
# Example 1:
# create dataframe
dat <- createDF(nVP = 6, nTrl = 1,
                design = list("Comp" = c("comp", "incomp")))

dat <- addDataDF(dat, RT = list(list(c("Comp:comp"), vals = c(500, 150, 100)),
                                list(c("Comp:incomp"), vals = c(520, 150, 100))))
printTable(dat) # latex formatted

aovRT <- ezANOVA(dat, dv=.(RT), wid = .(VP), within = .(Comp),
                 return_aov = TRUE, detailed = TRUE)
aovRT <- aovTable(aovRT)
printTable(aovRT$ANOVA) # latex formatted

## Not run: 
##D # Example use in *.Rnw Sweave file inside R chunk
##D # << printTable, echo = FALSE, results = tex >>=
##D # printTable(aovRT$ANOVA, caption = "ANOVA Table")
##D # @
## End(Not run)




