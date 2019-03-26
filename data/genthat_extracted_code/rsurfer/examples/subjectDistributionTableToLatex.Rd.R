library(rsurfer)


### Name: subjectDistributionTableToLatex
### Title: Convert Subject Distribution Table To LaTeX
### Aliases: subjectDistributionTableToLatex

### ** Examples

all <- generaterandomsubjects(1000)
all$Age <- stats::runif(1000,50,80)
all <- addrandomgender(all)
all <- addrandomdiagnosis(all)
sdt <- subjectDistributionTable(all, "Diagnosis")
subjectDistributionTableToLatex(subjectDistributionTable = sdt,
                                caption="Subject Distribution Table",
                                label="table:SDT", roundDP=1)



