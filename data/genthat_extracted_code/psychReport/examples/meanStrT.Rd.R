library(psychReport)


### Name: meanStrT
### Title: meanStrT
### Aliases: meanStrT

### ** Examples

library(psychReport)
requiredPackages(c("dplyr"))
# Example 1:
# create dataframe and add data
dat <- createDF(nVP = 10,
                nTrl = 50,
                design = list("Comp" = c("comp", "incomp")))

dat <- addDataDF(dat, RT = list(list(c("Comp:comp"), vals = c(500, 150, 100)),
                                list(c("Comp:incomp"), vals = c(520, 150, 100))))

# aggregate dat across trials
datAggVP <- dat %>%
    group_by(VP, Comp) %>%
    summarize(N = n(),
              rt = mean(RT))

tObj <- t.test(datAggVP$rt[dat$Comp == "comp"],
               datAggVP$rt[dat$Comp == "incomp"],
               paired = TRUE)

tString <- meanStrT(tObj, numDigits = 0, unit = "ms")

## Not run: 
##D # Example use in *.Rnw Sweave file
##D # \Sexpr{tString} 
## End(Not run)




