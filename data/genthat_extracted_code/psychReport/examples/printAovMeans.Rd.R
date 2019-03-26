library(psychReport)


### Name: printAovMeans
### Title: printAovMeans
### Aliases: printAovMeans

### ** Examples

library(psychReport)
requiredPackages(c("ez"))
# Example 1:
# create dataframe
dat <- createDF(nVP = 6,
                nTrl = 1,
                design = list("Comp" = c("comp", "incomp")))

dat <- addDataDF(dat, RT = list(list(c("Comp:comp"), vals = c(500, 150, 100)),
                                list(c("Comp:incomp"), vals =c(520, 150, 100))))

aovRT <- ezANOVA(dat, dv=.(RT), wid = .(VP), within = .(Comp), return_aov = TRUE, detailed = TRUE)
aovRT <- aovTable(aovRT)
printAovMeans(aovRT, digits = 0, dv = "ms")  # latex formatted

## Not run: 
##D # Example use in *.Rnw Sweave file inside R chunk
##D # << printTable, echo = FALSE, results = tex >>=
##D # printAovMeans(aovRT, caption = "ANOVA Table")
##D # @
## End(Not run)




