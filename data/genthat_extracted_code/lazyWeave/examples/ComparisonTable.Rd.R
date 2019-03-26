library(lazyWeave)


### Name: ComparisonTable
### Title: Comparison Tables
### Aliases: ComparisonTable catconttable cattable conttable

### ** Examples


#Read in the delivery dataset from the lazyWeave package
data(Delivery)

#Use conttable to summarize maternal age, ga weeks, weight (grams) 
#and grava by delivery type.  The dataset name is specified under the "data="
#option, the variables of interest are listed under "vars=", and the K-level by variable 
#is specified under "byVar=".

#Default is to report mean and bootstrapped 95% CI for mean.  Tests of location are by 
#default either Wilcoxon rank sum (K=2) or Kruskal-Wallis (K>2) rank sum.  The "seed="
#option allows for reproducibility by setting the seed for getting bootstrapped samples.

d_type.contable <- conttable(data=Delivery,
                             vars=c("maternal.age", "ga.weeks", "wt.gram", "grava"),
                                    byVar="delivery.type")

#Specifying weights by delivery type as a normally distributed variables, reports means, 
#standard deviations and a t-test of equality of the means for delivery type.  Variables listed 
#under "var.equal=" are assumed to have equal variances in all levels of byVar.  Otherwise, 
#variances are allowed to be unequal.

d_type.conttable <- conttable(data=Delivery,
                              vars=c("maternal.age", "ga.weeks", "wt.gram", "grava", "apgar1"),
                              byVar="delivery.type",
                              normal=c("wt.gram", "maternal.age"),
                              var.equal="ga.weeks")
                              
#List variables under "median=" to report median, 25th and 75th percentiles.
d_type.conttable <- conttable(data=Delivery,
                              vars=c("maternal.age", "ga.weeks", "wt.gram", "grava", "apgar1"),
                              byVar="delivery.type",
                              normal=c("wt.gram", "maternal.age"),
                              var.equal="ga.weeks",
                              median=c("grava","apgar1"))

#Use cattable to summarize child sex, laceration, and laceration degree by delivery type.
#Row percent, overall counts, and counts by delivery type are reported.  Column percents can 
#be specified by the row.p=FALSE option.
#By default chi-square tests of independence are performed.

d_type.cattable <- cattable(data=Delivery,
                            vars=c("child.sex", "laceration"),
                            byVar="delivery.type")

#For variables listed under "fisher=" Fisher's exact test of independence is performed.
#The reported test statistic is the odds ratio.

d_type.cattable <- cattable(data=Delivery,
                            vars=c("child.sex", "laceration"),
                            fisher=c("child.sex"),
                            byVar="delivery.type")


#All variables listed in a single table

d_type.catconttable <- catconttable(data=Delivery,
                                    vars=c("maternal.age", "ga.weeks", "child.sex", "wt.gram",
                                           "grava", "apgar1", "laceration"),
                                    median=c("grava", "apgar1"),
                                    normal="maternal.age",
                                    fisher="child.sex",
                                    byVar="delivery.type")

## Not run: 
##D   #Code for writing ctable objects to a file.  See write.ctable() for more information
##D   
##D   #Write to PDF
##D   options(lazyReportFormat='latex')
##D   lazy.write(
##D     lazy.file.start(),
##D     write.ctable(d_type.catconttable),
##D     lazy.file.end(),
##D     OutFile="SampleOutput.tex")
##D     
##D #Generate a pdf in the working directory
##D   lazy.build("SampleOutput.tex")
##D   
##D   unlink("SampleOutput.tex")
##D   unlink("SampleOutput.pdf")
## End(Not run) 




