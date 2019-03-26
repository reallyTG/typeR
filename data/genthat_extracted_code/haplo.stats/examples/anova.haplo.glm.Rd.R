library(haplo.stats)


### Name: anova.haplo.glm
### Title: Analysis of variance for haplo.glm model fit
### Aliases: anova.haplo.glm anova.haplo.glmlist
### Keywords: glm

### ** Examples

 data(hla.demo)
 geno <- as.matrix(hla.demo[,c(17,18,21:24)])
 keep <- !apply(is.na(geno) | geno==0, 1, any) # SKIP THESE THREE LINES
 hla.demo <- hla.demo[keep,]                   # IN AN ANALYSIS
 geno <- geno[keep,]                           # 
 attach(hla.demo)
 label <-c("DQB","DRB","B")
 y <- hla.demo$resp
 y.bin <- 1*(hla.demo$resp.cat=="low")

# set up a genotype array as a model.matrix for inserting into data frame
# Note that hla.demo is a data.frame, and we need to subset to columns
# of interest. Also also need to convert to a matrix object, so that
# setupGeno can code alleles and convert geno to 'model.matrix' class.

 geno <- setupGeno(geno, miss.val=c(0,NA))

  # geno now has an attribute 'unique.alleles' which must be passed to
  # haplo.glm as allele.lev=attributes(geno)$unique.alleles, see below

 my.data <- data.frame(geno=geno, age=hla.demo$age, male=hla.demo$male,
                        y=y, y.bin=y.bin)


 fit.gaus <- haplo.glm(y ~ male + geno, family = gaussian,  na.action=
               "na.geno.keep", data=my.data, locus.label=label,
               control = haplo.glm.control(haplo.freq.min=0.02))
 glmfit.gaus <- glm(y~male, family=gaussian, data=my.data)

 anova.haplo.glm(glmfit.gaus, fit.gaus)




