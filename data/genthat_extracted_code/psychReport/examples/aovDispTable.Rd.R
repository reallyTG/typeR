library(psychReport)


### Name: aovDispTable
### Title: aovDispTable
### Aliases: aovDispTable

### ** Examples

library(psychReport)
requiredPackages(c("ez"))
# Example 1:
# create dataframe
dat <- createDF(nVP = 6,
                nTrl = 1,
                design = list("Comp" = c("comp", "incomp")))

dat <- addDataDF(dat, RT = list(list(c("Comp:comp"), vals = c(500, 150, 100)),
                                list(c("Comp:incomp"), vals = c(520, 150, 100))))

aovRT <- ezANOVA(dat, dv=.(RT), wid = .(VP), within = .(Comp), return_aov = TRUE, detailed = TRUE)
aovDispTable(aovRT)




