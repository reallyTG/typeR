library(PKNCA)


### Name: exclude_nca
### Title: Exclude NCA parameters based on examining the parameter set.
### Aliases: exclude_nca exclude_nca_span.ratio exclude_nca_max.aucinf.pext
###   exclude_nca_min.hl.r.squared

### ** Examples

my_conc <- PKNCAconc(data.frame(conc=1.1^(3:0),
                                time=0:3,
                                subject=1),
                     conc~time|subject)
my_data <- PKNCAdata(my_conc,
                     intervals=data.frame(start=0, end=Inf,
                                          aucinf.obs=TRUE,
                                          aucpext.obs=TRUE))
my_result <- pk.nca(my_data)
my_result_excluded <- exclude(my_result,
                              FUN=exclude_nca_max.aucinf.pext())
as.data.frame(my_result_excluded)



