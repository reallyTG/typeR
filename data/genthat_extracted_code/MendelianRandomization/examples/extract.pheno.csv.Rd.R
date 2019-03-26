library(MendelianRandomization)


### Name: extract.pheno.csv
### Title: Extract summarized data from a PhenoScanner .csv file
### Aliases: extract.pheno.csv

### ** Examples

path.noproxy <- system.file("extdata", "vitD_snps_PhenoScanner.csv",
package = "MendelianRandomization")
path.proxies <- system.file("extdata", "vitD_snps_PhenoScanner_proxies.csv",
 package = "MendelianRandomization")
 # these two files from PhenoScanner are provided
 # as part of the MendelianRandomization package

extract.pheno.csv(
 exposure = "log(eGFR creatinine)", pmidE = 26831199, ancestryE = "European",
 outcome = "Tanner stage", pmidO = 24770850, ancestryO = "European", 
 file = path.noproxy)

extract.pheno.csv(
 exposure = "log(eGFR creatinine)", pmidE = 26831199, ancestryE = "European",
 outcome = "Tanner stage", pmidO = 24770850, ancestryO = "European",
 rsq.proxy = 0.6, file = path.proxies)

extract.pheno.csv(
 exposure = "log(eGFR creatinine)", pmidE = 26831199, ancestryE = "European",
 outcome = "Asthma", pmidO = 20860503, ancestryO = "European",
 rsq.proxy = 0.6, file = path.proxies)




