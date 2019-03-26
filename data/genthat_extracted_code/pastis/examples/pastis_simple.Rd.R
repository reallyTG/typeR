library(pastis)


### Name: pastis_simple
### Title: A simplified interface to the main pastis function.
### Aliases: pastis_simple

### ** Examples

# Generate MrBayes input files with constraints
## Not run: 
##D data(accipitridaeFullPastis)
##D pastis_simple(accipitridaeFullPastis, base_name="Accipitridae")
##D 
##D data(accipitridaeBasicPastis)
##D pastis_simple(accipitridaeBasicPastis, base_name="AccipitridaeBasic")
## End(Not run)

data(pastis_data_1)
pastis_simple(pastis_data_1, base_name="pastis_data_1")
unlink("pastis_data_1.nexus")

data(pastis_data_2)
pastis_simple(pastis_data_2, base_name="pastis_data_2")
unlink("pastis_data_2.nexus")

data(pastis_data_3)
pastis_simple(pastis_data_3, base_name="pastis_data_3")
unlink("pastis_data_3.nexus")



