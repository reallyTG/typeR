library(pastis)


### Name: pastis_main
### Title: Phylogenetic Assembly with Soft Taxonomic Inferences
### Aliases: pastis_main

### ** Examples

## Not run: 
##D # Generate MrBayes input files with constraints
##D data(accipitridaeFullPastis)
##D pastis_main(accipitridaeFullPastis, output_file="Accipitridae.nexus")
##D 
##D data(accipitridaeBasicPastis)
##D pastis_main(accipitridaeBasicPastis, output_file="AccipitridaeBasic.nexus")
## End(Not run)

data(pastis_data_1)
pastis_main(pastis_data_1, output_file="pastis_data_1")
unlink("pastis_data_1.nexus")

data(pastis_data_2)
pastis_main(pastis_data_2, output_file="pastis_data_2")
unlink("pastis_data_2.nexus")

data(pastis_data_3)
pastis_main(pastis_data_3, output_file="pastis_data_3")
unlink("pastis_data_3.nexus")



