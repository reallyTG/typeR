library(psychReport)


### Name: ciStrT
### Title: ciStrT
### Aliases: ciStrT

### ** Examples

requiredPackages(c("dplyr"))
# Example 1:
# create dataframe and add data with 2(Comp: comp vs. incomp) levels
dat <- createDF(nVP = 20,
                nTrl = 50,
                design = list("Comp" = c("comp", "incomp")))

dat <- addDataDF(dat, RT = list(list(c("Comp:comp"), vals = c(500, 150, 100)),
                                list(c("Comp:incomp"), vals = c(520, 150, 100))))

# aggregate dat across trials
datAggVP <- dat %>%
    group_by(VP, Comp) %>%
    summarize(N  = n(),
              rt = mean(RT))

tObj <- t.test(datAggVP$rt[datAggVP$Comp == "comp"],
               datAggVP$rt[datAggVP$Comp == "incomp"],
               paired = TRUE)

ciString <- ciStrT(tObj, unit = "ms")

## Not run: 
##D # Example use in *.Rnw Sweave file
##D # \Sexpr{ciString}
## End(Not run)




