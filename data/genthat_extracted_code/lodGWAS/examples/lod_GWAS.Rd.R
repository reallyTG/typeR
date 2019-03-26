library(lodGWAS)


### Name: lod_GWAS
### Title: Genome Wide Association Analysis accounting for Limit of
###   Detection
### Aliases: lod_GWAS

### ** Examples

# For use in this example, the 3 Sample files in the
# extdata folder of the lodGWAS library will be copied
# to your current R working directory
  
## Not run: 
##D 
##D file.copy(from = file.path(system.file("extdata", package = "lodGWAS"), "Sample_geno.dose"),
##D                to = getwd(), overwrite = FALSE, recursive = FALSE)
##D file.copy(from = file.path(system.file("extdata", package = "lodGWAS"), "Sample_geno.map"),
##D                to = getwd(), overwrite = FALSE, recursive = FALSE)
##D file.copy(from = file.path(system.file("extdata", package = "lodGWAS"), "Sample_pheno.txt"),
##D                to = getwd(), overwrite = FALSE, recursive = FALSE)
##D 
##D lod_GWAS(phenofile = "Sample_pheno.txt", pheno_name = "outcome1",
##D          basic_model = "sex",
##D          mapfile = "Sample_geno.map", genofile = "Sample_geno.dose",
##D          outputfile = "Sample_output.txt", gzip_output = FALSE,
##D          lower_limit = 0.1, upper_limit = 2)
## End(Not run)



