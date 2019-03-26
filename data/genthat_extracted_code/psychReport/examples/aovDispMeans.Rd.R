library(psychReport)


### Name: aovDispMeans
### Title: aovDispMeans
### Aliases: aovDispMeans

### ** Examples

library(psychReport)
requiredPackages(c("ez"))
# Example 1:
# create dataframe
dat <- createDF(nVP = 50,
                nTrl = 1,
                design = list("Comp" = c("comp", "incomp")))

dat <- addDataDF(dat, RT = list(list(c("Comp:comp"), vals = c(500, 100, 100)),
                                list(c("Comp:incomp"), vals = c(520, 100, 100))))

aovRT <- ezANOVA(dat, dv=.(RT), wid = .(VP), within = .(Comp),
                 return_aov = TRUE, detailed = TRUE)
aovRT <- aovTable(aovRT)
aovDispMeans(aovRT)




