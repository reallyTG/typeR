library(HAP.ROR)


### Name: HAP.ROR-package
### Title: Recursive Organizer (ROR)
### Aliases: HAP.ROR-package HAP.ROR

### ** Examples

library("HAP.ROR")
data(case.sub)
data(ctl.sub)
data(lib.sub)
data(lib.sub.names)
ror.res <- HAP.ror(case.sub, ctl.sub, lib.sub, lib.sub.names, alpha=0.01, ref.level="101");

# grouping result:
round(ror.res$dev.list, 2);
round(ror.res$AIC.list, 2);
ror.res$df.list;
ror.res$deleted.snps;
ror.res$grp.result;
ror.res$significant;
# model summary:
ror.res$model.summary;
# output tables and figures used for ror result
data(proteinf)
ODS.ror(case.sub=case.sub, ctl.sub=ctl.sub, lib.sub=lib.sub, lib.sub.names=lib.sub.names, records=ror.res$records, dev.list=ror.res$dev.list, AIC.list=ror.res$AIC.list, deleted.snps.ls=ror.res$deleted.snps.ls, proteinf=proteinf, locus="DRB1*", ref.level="101");




